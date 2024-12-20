import numpy as np

from shared import load_data, plot_progress, plot_confusion_matrix

# Função para normalizar e achatar as imagens
def preprocess_data(train_x: np.ndarray, test_x: np.ndarray):
    """
    Normaliza os valores das imagens (0-255 -> 0-1) e as achata para vetores.
    
    Parameters:
        train_x, test_x (numpy.ndarray): Dados de entrada.
    
    Returns:
        tuple: Dados de entrada normalizados e achatados.
    """
    train_x_flat = train_x.reshape(train_x.shape[0], -1).T / 255.0  # (n_pixels, n_amostras)
    test_x_flat = test_x.reshape(test_x.shape[0], -1).T / 255.0
    return train_x_flat, test_x_flat

# Inicializa pesos e bias
def initialize_parameters(n_x):
    """
    Inicializa os parâmetros do modelo: pesos (w) e bias (b).
    Não é randômico, pois é um modelo linear
    
    Parameters:
        n_x (int): Número de entradas (pixels da imagem).
    
    Returns:
        tuple: Vetor de pesos inicializados como zeros e bias como 0.
    """
    w = np.zeros((n_x, 1))  # Vetor coluna com n_x entradas
    b = 0.0  # Bias inicial
    return w, b


# Calcula a função sigmoide
def sigmoid(z):
    """
    Aplica a função sigmoide ao vetor de entrada.
    
    Parameters:
        z (numpy.ndarray): Soma ponderada das entradas.
    
    Returns:
        numpy.ndarray: Probabilidade para cada amostra.
    """
    return 1 / (1 + np.exp(-z))

# Treina o modelo de regressão logística
def train(w, b, X, Y, num_iterations, learning_rate, lambd=0.1):
    """
    Treina o modelo ajustando pesos e bias para minimizar a função de custo.
    
    Parameters:
        w, b (numpy.ndarray, float): Pesos e bias iniciais.
        X (numpy.ndarray): Dados de entrada (pixels achatados).
        Y (numpy.ndarray): Rótulos reais (0 ou 1).
        num_iterations (int): Número de iterações de treinamento.
        learning_rate (float): Taxa de aprendizado.
    
    Returns:
        tuple: Pesos, bias ajustados e lista de custos durante o treinamento.
    """
    costs = []  # Para registrar o custo em cada 100 iterações
    m = X.shape[1]  # Número de amostras
    
    for i in range(num_iterations):
        # Forward: calcular predições
        Z = np.dot(w.T, X) + b  # Soma ponderada
        A = sigmoid(Z)  # Probabilidade prevista
        
        # Calcular o custo (log-loss)
        cost = -np.sum(Y * np.log(A) + (1 - Y) * np.log(1 - A)) / m
        # Adicionar regularização L2
        # cost += (lambd / (2 * m)) * np.sum(abs(w))
        
        # Gradientes para atualizar pesos e bias
        dw = np.dot(X, (A - Y).T) / m  # Derivada parcial em relação a w
        # Adicionar regularização L2
        # dw += (lambd / m) * w
        # Derivada parcial em relação a b
        db = np.sum(A - Y) / m
        
        # Atualizar pesos e bias
        w -= learning_rate * dw
        b -= learning_rate * db
        
        # Registrar custo a cada 100 iterações
        if i % 100 == 0:
            costs.append(cost)
    
    return w, b, costs

# Faz predições
def predict(w, b, X):
    """
    Faz predições usando os parâmetros ajustados.
    
    Parameters:
        w, b (numpy.ndarray, float): Pesos e bias ajustados.
        X (numpy.ndarray): Dados de entrada para previsão.
    
    Returns:
        numpy.ndarray: Rótulos previstos (0 ou 1).
    """
    Z = np.dot(w.T, X) + b  # Soma ponderada
    A = sigmoid(Z)  # Probabilidade prevista
    Y_pred = (A > 0.5).astype(int)  # Limiar de 0.5
    return Y_pred.reshape(-1)

# Função principal
def logistic_regression(training_file, test_file, num_iterations=2000, learning_rate=0.001):
    """
    Executa o treinamento e avaliação do modelo de regressão logística.
    
    Parameters:
        training_file, test_file (str): Caminhos para arquivos H5.
        num_iterations (int): Número de iterações de treinamento.
        learning_rate (float): Taxa de aprendizado.
    
    Returns:
        tuple: Pesos ajustados, bias e precisão dos conjuntos de treino e teste.
    """
    # Carregar e pré-processar os dados
    train_x, train_y, test_x, test_y = load_data(training_file, test_file)
    train_x, test_x = preprocess_data(train_x, test_x)
    train_y = train_y.reshape(1, -1)  # Garantir dimensão correta
    test_y = test_y.reshape(-1)
    
    # Inicializar parâmetros
    n_x = train_x.shape[0]  # Número de entradas (pixels)
    w, b = initialize_parameters(n_x)
    
    # Treinar o modelo
    w, b, costs = train(w, b, train_x, train_y, num_iterations, learning_rate)
    
    # Fazer predições nos dados de treinamento e teste
    train_pred = predict(w, b, train_x)
    test_pred = predict(w, b, test_x)
    
    # Calcular precisão
    train_accuracy = 100 - np.mean(np.abs(train_pred - train_y)) * 100    
    print(f"Train Accuracy: {train_accuracy:.2f}%")
    test_accuracy = 100 - np.mean(np.abs(test_pred - test_y)) * 100
    print(f"Test Accuracy: {test_accuracy:.2f}%")
    return test_y, test_pred, costs

# Exemplo de execução
if __name__ == "__main__":
    test_y, test_pred, costs = logistic_regression(
        "train_catvnoncat.h5", "test_catvnoncat.h5",
        num_iterations=250, learning_rate=0.005)
    plot_confusion_matrix(test_y, test_pred)
    plot_progress([(costs, 'cost')], "Iterations (per 100)", "Cost", "Cost Reduction Over Time")
