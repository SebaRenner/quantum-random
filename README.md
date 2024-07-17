# Quantum Random
I got the idea for this random number generator a couple of years ago at a university talk when I first heard about the superposition state of qubits, which you can create by applying the Hadamard gate.

The logic is simple. You create *n* qubits, where the number of qubits defines the range of your random number. By applying the Hadamard gate to each qubit and then measuring them, you obtain a random 0 or 1 for each qubit. Combining all the measured bits gives you a binary random number

## About the Quantum Development Kit
In January 2024 the old Quantum SDK was dropped in favor of Azure Quantum. Whilst most Q# operations and functions stay as is, the developer experience suffered significantly (at least in my eyes..).

A Q# project now consists of a `qsharp.json` file and a `src` folder. There is no `$schema` for the JSON. Also the old `@Test()` attribute is gone and there is no test runner? So I had to use the only `@EntryPoint()` for executing all test functions. Also the `Assert` function is gone. I used the new `Fact` function instead (not sure if it's meant for that or for checking invarients within your operations). But hey, at least we can simulate quantum computers on our local machines :)