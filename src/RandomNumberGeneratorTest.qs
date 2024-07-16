namespace QuantumRandom {
    open Microsoft.Quantum.Diagnostics;

    @EntryPoint()
    operation RunUnitTests() : Unit {
        TestGenerateRandomNumber_WithinRange();
        TestGenerateNRandomBits_5Bits();
        TestResultArrayToInt_AllZeros();
        TestResultArrayToInt_ZeroOneZero();
    }

    operation TestGenerateRandomNumber_WithinRange(): Unit {
        // Arrange
        let nBits = 5;

        // Act
        let randomNumber = GenerateRandomNumber(5);

        // Assert
        Fact(randomNumber >= 0 and randomNumber <= 31, "TestGenerateRandomNumber_WithinRange failed");
    }

    operation TestGenerateNRandomBits_5Bits(): Unit {
        // Arrange
        let nBits = 5;

        // Act
        let result = GenerateNRandomBits(nBits);

        // Assert
        Fact(Length(result) == nBits, "TestGenerateNRandomBits_5Bits failed");
    }

    function TestResultArrayToInt_AllZeros() : Unit {
        // Arrange
        let resultArr = [Zero, Zero, Zero, Zero, Zero];
        let expected = 0;

        // Act
        let result = ResultArrayToInt(resultArr);

        // Assert
        Fact(result == expected, "TestResultArrayToInt_AllZeros failed");
    }

    function TestResultArrayToInt_ZeroOneZero() : Unit {
        // Arrange
        let resultArr = [Zero, One, Zero];
        let expected = 2;

        // Act
        let result = ResultArrayToInt(resultArr);

        // Assert
        Fact(result == expected, "TestResultArrayToInt_ZeroOneZero failed");
    }
}