from ag import run, test_cases

def main():
    print("Enter test type: \nNone: All tests\n0: Random test\nN: Test N (1, n)\n-1: Bigger test")
    print("Test cases:")
    for i, test in enumerate(test_cases):
        print(f"{i + 1}: {test}")
    test = input()
    if test == "": run()
    else:
        while int(test) < -1 or int(test) > len(test_cases):
            print("Invalid test. Please enter a valid test case.")
            test = input()
        
    run(test)
    
if __name__ == "__main__":
    main()
