import numpy as np
import h5py
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Flatten
from tensorflow.keras.optimizers import Adam
from sklearn.metrics import accuracy_score
import matplotlib.pyplot as plt

# Função para carregar os dados do arquivo H5
def load_data(training_file, test_file):
    """
    Carrega os dados de treinamento e teste a partir de arquivos .h5.
    
    Parameters:
        training_file (str): Caminho para o arquivo de treinamento.
        test_file (str): Caminho para o arquivo de teste.
    
    Returns:
        tuple: Dados de treinamento (X, Y) e teste (X, Y).
    """
    with h5py.File(training_file, "r") as train_h5:
        train_x = np.array(train_h5["train_set_x"][:])  # Imagens de treinamento
        train_y = np.array(train_h5["train_set_y"][:])  # Rótulos de treinamento
    with h5py.File(test_file, "r") as test_h5:
        test_x = np.array(test_h5["test_set_x"][:])  # Imagens de teste
        test_y = np.array(test_h5["test_set_y"][:])  # Rótulos de teste
    return train_x, train_y, test_x, test_y

# Função principal para treinar e avaliar o modelo
def train_cat_classifier(training_file, test_file):
    """
    Treina uma rede neural rasa para classificar imagens como 'gato' ou 'não gato'.
    Args:
        training_file (str): Caminho para o arquivo de dados .h5.
        test_file (str): Caminho para o arquivo de teste .h5.
    """
    # 1. Carregar os dados
    print("Carregando os dados...")
    train_x, train_y, test_x, test_y = load_data(training_file, test_file)

    # 2. Normalizar os dados de entrada (valores entre 0 e 1)
    train_x = train_x / 255.0
    test_x = test_x / 255.0

    # 3. Garantir que os rótulos sejam vetores unidimensionais
    train_y = train_y.reshape(-1)
    test_y = test_y.reshape(-1)

    # 4. Criar o modelo
    print("Criando a rede neural...")
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
    print("Treinando o modelo...")
    history = model.fit(train_x, train_y, 
                        validation_split=0.1,  # Usar 10% dos dados de treino para validação
                        epochs=100,  # Número de épocas de treinamento
                        batch_size=32,  # Tamanho do lote para atualização dos pesos
                        verbose=1 # 1: Mostrar barra de progresso
                        )

    # 7. Avaliar o modelo
    print("Avaliando o modelo...")
    test_loss, test_accuracy = model.evaluate(test_x, test_y)

    # 8. Visualizar a curva de perda
    plt.plot(history.history['accuracy'], label='Acurácia de Treinamento')
    plt.plot(history.history['val_accuracy'], label='Acurácia de Validação')
    plt.xlabel('Épocas')
    plt.ylabel('Acurácia')
    plt.legend()
    plt.title('Curva de Acurácia')
    plt.show()

# Chamada principal do script
if __name__ == "__main__":
    train_cat_classifier("train_catvnoncat.h5", "test_catvnoncat.h5")
