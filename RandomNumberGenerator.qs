namespace QuantumRandom {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Main() : Result[] {
        let nBits = 8;
        return GenerateNRandomBits(nBits);
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