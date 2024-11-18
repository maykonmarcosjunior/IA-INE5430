import h5py
import matplotlib.pyplot as plot
import numpy

from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import MinMaxScaler

class QuickDebug:

    def peek_h5():
        with h5py.File("train_catvnoncat.h5", "r") as file:
    
            print(file.keys())

            classes = file['list_classes'][:] # classes 'cat' e 'non-cat'
            images = file['train_set_x'][:] # images
            labels = file['train_set_y'][:] # labels

            print(classes)

            for i in range(5):
                plot.imshow(images[i])
                plot.title(f"{labels[i]}")
                plot.show()

class Perceptron:

    def __init__(self, file: h5py.File):
        self.__classes = file['list_classes']
        self.__images = file['train_set_x']
        self.__labels = file['train_set_y']
        self.__has_generated_model = False

    @property
    def classes(self):
        return self.__classes

    @property
    def images(self):
        return self.__images
    
    @property
    def labels(self):
        return self.__labels
    
    @property
    def model(self):
        if self.__has_generated_model:
            return self.__model
        else:
            raise NotImplementedError

    def generate_model(self):
        """
        NOTE: Não funciona
        """
        flattened_images = [image for image in self.images]
        print(flattened_images[1])
        flattened_images = flattened_images / 255.0

        self.__model = LogisticRegression()
        self.__model.fit(flattened_images, self.labels)
        self.__has_generated_model = True

    def predict(self, file: h5py.File):
        images = file['test_set_x']
        labels = file['test_set_y']

        predictions = self.model.predict(images)

        accuracy = self.model.score(images, labels)
        print(f"Acurácia: {accuracy}")
