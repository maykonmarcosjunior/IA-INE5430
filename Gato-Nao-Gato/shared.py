import h5py
import matplotlib.pyplot as plt
import numpy as np

def plot_confusion_matrix(test_y, test_pred):
    """
    Plota a matriz de confusão a partir dos rótulos reais e predições.
    
    Parameters:
        test_y (numpy.ndarray): Rótulos reais.
        test_pred (numpy.ndarray): Rótulos previstos.
    """
    confusion_matrix = np.zeros((2, 2), dtype=int)  
    for i in range(len(test_y)):
        confusion_matrix[test_y[i], test_pred[i]] += 1
    
    fig, ax = plt.subplots()
    im = ax.imshow(confusion_matrix, cmap="Blues")
    
    # Adicionar rótulos
    # adds a labels to indicate the meaning of the values
    ax.set_xlabel("Predicted label")
    ax.set_ylabel("True label")
    ax.set_xticks([0, 1])
    ax.set_yticks([0, 1])
    ax.set_xticklabels(["Non-Cat", "Cat"])
    ax.set_yticklabels(["Non-Cat", "Cat"])
    
    # Adicionar anotações
    for i in range(2):
        for j in range(2):
            text = ax.text(j, i, confusion_matrix[i, j], ha="center", va="center", color="black")
    
    ax.set_title("Confusion Matrix")
    fig.tight_layout()
    plt.show()

def plot_progress(labels, xlabel, ylabel, title):
    
    # Plotar custo ao longo do tempo
    for history, label in labels:
        plt.plot(history, label=label)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.legend()
    plt.title(title)
    plt.show()

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
