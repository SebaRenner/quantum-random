namespace QuantumRandom {
    open Microsoft.Quantum.Diagnostics;

    @EntryPoint()
    operation RunUnitTests() : Unit {
        TestResultArrayToInt_AllZeros();
        TestResultArrayToInt_ZeroOneZero();
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

    // Why this cannot be imported from the other file, no clue...
    function ResultArrayToInt(results : Result[]): Int {
        let nBits = Length(results);

        mutable number = 0;
        for idx in 0..nBits - 1 {
            if (results[idx] == One) {
                set number |||= 1 <<< idx;
            }
        }

        return number;
    }
}