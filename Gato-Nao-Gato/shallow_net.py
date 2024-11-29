from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Flatten
from tensorflow.keras.optimizers import Adam

from shared import load_data, plot_progress, plot_confusion_matrix

# Função principal para treinar e avaliar o modelo
def train_cat_classifier(training_file, test_file):
    """
    Treina uma rede neural rasa para classificar imagens como 'gato' ou 'não gato'.
    Args:
        training_file (str): Caminho para o arquivo de dados .h5.
        test_file (str): Caminho para o arquivo de teste .h5.
    """
    # 1. Carregar os dados
    train_x, train_y, test_x, test_y = load_data(training_file, test_file)

    # 2. Normalizar os dados de entrada (valores entre 0 e 1)
    train_x = train_x / 255.0
    test_x = test_x / 255.0

    # 3. Garantir que os rótulos sejam vetores unidimensionais
    train_y = train_y.reshape(-1)
    test_y = test_y.reshape(-1)

    # 4. Criar o modelo
    model = Sequential([
        Flatten(input_shape=(64, 64, 3)),  # Achatar a imagem de entrada
        Dense(20, activation='relu'),  # Camada densa intermediária com ativação ReLU
        Dense(1, activation='sigmoid')  # Camada de saída com ativação sigmoide
    ])

    # 5. Compilar o modelo
    model.compile(optimizer=Adam(learning_rate=0.001),
                  loss='binary_crossentropy',
                  metrics=['accuracy'])

    # 6. Treinar o modelo
    history = model.fit(train_x, train_y, 
                        validation_split=0.1,  # Usar 10% dos dados de treino para validação
                        epochs=100,  # Número de épocas de treinamento
                        batch_size=32,  # Tamanho do lote para atualização dos pesos
                        verbose=0 # 1: Mostrar barra de progresso
                        )
    return history, model, test_y, test_x

# Chamada principal do script
if __name__ == "__main__":
    history, model, test_y, test_x = train_cat_classifier("train_catvnoncat.h5", "test_catvnoncat.h5")

    test_pred = model.predict(test_x)
    test_pred = (test_pred > 0.5).astype(int).reshape(-1)
    plot_confusion_matrix(test_y, test_pred)
    # Visualizar a curva de acurácia
    plot_progress([(history.history['accuracy'], 'Acurácia de Treinamento'),
                   (history.history['val_accuracy'], 'Acurácia de Validação')],
                  "Épocas", "Acurácias", "Curva de Acurácia")

    # 7. save model
    model.save("cat_classifier.keras")
