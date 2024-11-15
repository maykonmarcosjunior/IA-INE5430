import pygad
import numpy
from functools import partial
import time

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

last_fitness = 0

def run(test_type=None):
    
    if test_type == None or test_type == '':   
        run_tests = test_cases 

    elif test_type == '0':
        run_tests = [test_cases[numpy.random.randint(0, len(test_cases))]]

    elif test_type == '-1':
        n_values = numpy.random.randint(200, 300)
        values = numpy.random.randint(1, 100, n_values)
        target = numpy.random.randint(1, 100)
        run_tests = [(values, target)]

    else:
        run_tests = [test_cases[int(test_type) - 1]]

    begin = time.time()
    test(run_tests)
    end = time.time()    
    print(f"Time running: {end - begin}")  
   

def test(cases):

    file = open("solution.txt", "w")
    file.close()

    for inputs, output in cases:

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
            mutation_percent_genes=20,
            mutation_probability=0.1,
            delay_after_gen=0,         
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

        ga_instance.plot_fitness(
            title="Test case {inputs}, {output}".format(inputs=inputs, output=output)
        )

        write_solution(inputs, output, solution, solution_fitness, prediction)


def write_solution(inputs, desired_output, solution, solution_fitness, prediction):
    file = open("solution.txt", "a")
    file.write("Inputs = {inputs}\n".format(inputs=inputs))
    file.write(
        "Desired output = {desired_output}\n".format(desired_output=desired_output)
    )
    file.write(
        "Parameters of the best solution : {solution}\n".format(solution=solution)
    )
    file.write(
        "Fitness value of the best solution = {solution_fitness}\n".format(
            solution_fitness=solution_fitness
        )
    )
    file.write(
        "Predicted output based on the best solution : {prediction} \n\n".format(
            prediction=prediction
        )
    )
    file.close()


def callback_generation(ga_instance):
    global last_fitness
    print(f"Generation = {ga_instance.generations_completed}")
    print(f"Fitness    = {ga_instance.best_solution()[1]}")
    print(f"Change     = {ga_instance.best_solution()[1] - last_fitness}")
    last_fitness = ga_instance.best_solution()[1]
