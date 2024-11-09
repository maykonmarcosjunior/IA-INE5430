import pygad
import numpy

func_inputs = [4, 3, 5, 7, 6, 8, 9]
desired_output = 15

"""
A fitness function for the Subset-Sum problem
"""
def fitness_func(ga_instance, solution, solution_idx):
    global func_inputs
    global desired_output    
    output = numpy.sum(numpy.array(func_inputs)*solution)
    diff = abs(desired_output - output)
    fitness = 1.0 / (diff + 1)

    return fitness

# variables
num_generations = 100
num_parents_mating = 5
sol_per_pop = len(func_inputs)
num_genes = len(func_inputs)
gene_space = [0, 1]

# Creating an instance of the GA class inside the ga module.
# Some parameters are initialized within the constructor.

ga_instance = pygad.GA(num_generations=num_generations, 
                       num_parents_mating=num_parents_mating, 
                       fitness_func=fitness_func, 
                        sol_per_pop=sol_per_pop,
                        num_genes=num_genes,
                        gene_space=gene_space
)

# Running the GA to optimize the parameters of the function.
ga_instance.run()

# After the generations complete, some plots are showed that summarize the how the outputs/fitenss values evolve over generations.

solution, solution_fitness, solution_idx = ga_instance.best_solution()
print("Parameters of the best solution : {solution}".format(solution=solution))
print("Fitness value of the best solution = {solution_fitness}".format(solution_fitness=solution_fitness))

prediction = numpy.sum(numpy.array(func_inputs)*solution)
print("Predicted output based on the best solution : {prediction}".format(prediction=prediction))
