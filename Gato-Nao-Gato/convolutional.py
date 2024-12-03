from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense

from shared import load_data, plot_progress, plot_confusion_matrix

def convolutional_classifier(training_file: str, test_file: str):
    """
    Treina uma rede convolucional para classificar imagens como 'gato' ou 'não gato'.
    Args:
        training_file (str): Caminho para o arquivo de dados .h5.
        test_file (str): Caminho para o arquivo de teste .h5.
    """

    # Carrega os dados
    train_x, train_y, test_x, test_y = load_data(training_file, test_file)

    # Normaliza
    train_x = train_x / 255
    train_y = train_y / 255

    # Modelo sequencial
    model = Sequential([
        Conv2D(64, (4, 4), activation='tanh', input_shape=(64, 64, 3)),
        MaxPooling2D((2, 2)),
        Flatten(),
        Dense(128, activation='tanh'),
        Dense(10, activation='softmax')
    ])

    model.compile(
        optimizer='rmsprop',
        loss='sparse_categorical_crossentropy',
        metrics=['accuracy']
    )

    history = model.fit(
        train_x,
        train_y,
        validation_split=0.1,
        epochs=30,
        batch_size=16
    )

    return history, model, test_y, test_x


if __name__ == "__main__":

    history, model, test_y, test_x = convolutional_classifier("train_catvnoncat.h5", "test_catvnoncat.h5")

    # test_pred = model.predict(test_x)
    # test_pred = (test_pred > 0.5).astype(int).reshape(-1)
    # plot_confusion_matrix(test_y, test_pred)
    # plot_progress([
    #     (history.history['accuracy'], 'Acurácia de Treinamento'),
    #     (history.history['val_accuracy'], 'Acurácia de Validação')],
    #     "Épocas", "Acurácias", "Curva de Acurácia"
    # )

    # model.save("convolutional_cat_classifier.keras")