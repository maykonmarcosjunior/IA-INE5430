import neural
import h5py

def main():
    # neural.QuickDebug.peek_h5()

    training_file = "train_catvnoncat.h5"
    testing_file = "test_catvnoncat.h5"

    h5_file = h5py.File(training_file, "r")

    perceptron = neural.Perceptron(h5_file)
    perceptron.generate_model()

if __name__ == "__main__":
    main()