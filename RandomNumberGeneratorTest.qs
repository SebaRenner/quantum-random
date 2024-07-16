namespace QuantumRandom {
    open Microsoft.Quantum.Diagnostics;

    @EntryPoint()
    operation RunUnitTests() : Unit {
        TestGenerateNRandomBits_5Bits();
        TestResultArrayToInt_AllZeros();
        TestResultArrayToInt_ZeroOneZero();
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

    operation GenerateNRandomBits(nBits : Int) : Result[] {
        use qubits = Qubit[nBits];

        // Apply Hadamard transfomation on each qubit to set it into superposition.
        for qubit in qubits {
            H(qubit);
        }

        // Measure each qubit in the Z basis and reset them 
        mutable results = [];
        for qubit in qubits {
            set results += [MResetZ(qubit)];
        }
        return results;
    }
}