import UIKit

protocol Pessoa {
    var nome: String {get set}
    var sobrenome: String {get set}
    var idade: NSNumber {get set}
}

struct Aluno: Pessoa {
    var nome: String
    var sobrenome: String
    var idade: NSNumber
    
    var nomeCompleto: String {
        return nome + " " + sobrenome
    }
}

var aluno = Aluno(nome: "Wilson", sobrenome: "Matokanovic", idade: 29)
var novoAluno = aluno

print("Primeiro:: ")
print(aluno.nomeCompleto)
print(novoAluno.nomeCompleto)

aluno.nome = "Julieta"

print("Depois:: ")
print(aluno.nomeCompleto)
print(novoAluno.nomeCompleto)
