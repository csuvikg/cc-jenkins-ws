def add_numbers(a, b):
    return a + b


if __name__ == "__main__":
    import sys

    if len(sys.argv) != 3:
        print("Usage: python main.py <number1> <number2>")
        sys.exit(1)

    num1 = float(sys.argv[1])
    num2 = float(sys.argv[2])

    result = add_numbers(num1, num2)
    print(f"The result is {result}")
