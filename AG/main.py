import pygad
import numpy
from functools import partial

# defines multiple test cases
test_cases = [
    ([3, 34, 4, 12, 5, 2], 9),  # true
    ([3, 34, 4, 12, 5, 2], 30),  # false
    ([10, 7, 5, 18, 12, 20, 15], 35),  # true
    ([1, 2, 3, 8, 7, 4], 11),  # true
    ([2, 3, 5, 7, 10], 14),  # true
    ([1, 3, 9, 2, 7, 8, 5], 15),  # true
    ([20, 15, 10, 5, 2], 25),  # true
    ([7, 14, 3, 12, 6, 10, 5], 21),  # true
    ([1, 6, 2, 8, 4, 3, 5], 13),  # true
]

# variables
num_generations = 100
num_parents_mating = 5
gene_space = [0, 1]


def test():
    # delete solution.txt if exists
    file = open("solution.txt", "w")
    file.close()
    
    for inputs, output in test_cases:

        """
        A fitness function for the Subset-Sum problem
        """

        def fitness_func(ga_instance, solution, solution_idx):
            output_sum = numpy.sum(numpy.array(inputs) * solution)
            diff = abs(output - output_sum)
            fitness = 1.0 / (diff + 1)

            return fitness

        sol_per_pop = len(inputs)
        num_genes = len(inputs)

        # Creating an instance of the GA class inside the ga module.
        # Some parameters are initialized within the constructor.

        ga_instance = pygad.GA(
            num_generations=num_generations,
            num_parents_mating=num_parents_mating,
            fitness_func=fitness_func,
            sol_per_pop=sol_per_pop,
            num_genes=num_genes,
            gene_space=gene_space,
        )

        # Running the GA to optimize the parameters of the function.

        ga_instance.run()

        solution, solution_fitness, solution_idx = ga_instance.best_solution()
        prediction = numpy.sum(numpy.array(inputs) * solution)
        print(
            "Predicted output based on the best solution : {prediction}".format(
                prediction=prediction
            )
        )
        print("Expected output : {output}".format(output=output))
        print("Solution : {solution}".format(solution=solution))
        print("Fitness : {solution_fitness}".format(solution_fitness=solution_fitness))
        print("")
        
        write_solution(inputs, output, solution, solution_fitness, prediction )


def write_solution(inputs, desired_output, solution, solution_fitness, prediction):
    file = open("solution.txt", "a")
    file.write("Inputs = {inputs}\n".format(inputs=inputs))    
    file.write("Desired output = {desired_output}\n".format(desired_output=desired_output))
    file.write("Parameters of the best solution : {solution}\n".format(solution=solution))
    file.write("Fitness value of the best solution = {solution_fitness}\n".format(solution_fitness=solution_fitness))
    file.write("Predicted output based on the best solution : {prediction} \n\n".format(prediction=prediction))
    file.close()    
    
test()
