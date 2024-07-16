namespace QuantumRandom {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Intrinsic;

    operation GenerateRandomNumber(nBits : Int) : Int {
        let randomBits = GenerateNRandomBits(nBits);
        return ResultArrayToInt(randomBits);
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