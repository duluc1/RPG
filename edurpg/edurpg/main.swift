//
//  main.swift
//  edurpg
//
//  Created by EDUARDO LUCREDIO on 14/11/25.
//

import Foundation
var inventario:[String]=[]
var dano:Int=0
var defesa:Int=0
func podeEntrarNaLoja(moedas: Int) -> Bool {
    if moedas <= 0 {
        print("Você não tem moedas suficientes para entrar na loja! Vaza!")
        return false
    }else{
    return true
    }
}

print("Quantas moedas você tem?")
var moedas = Int(readLine() ?? "") ?? 0

if podeEntrarNaLoja(moedas: moedas) {
    print("---Bem vindo ao Empório dos Anões! Sinta-se em casa e aproveite nossos produtos!---")
}
let loja=[
    "Espada":[
        "dano":10,
        "durabilidade":5,
        "defesa":3,
        "preco":50
    ],
    "Escudo de madeira":[
        "dano":3,
        "durabilidade":15,
        "defesa":10,
        "preco":35
        ],
    "Pocao de cura":[
        "dano":0,
        "durabilidade":1,
        "defesa":0,
        "preco":10
    ],
    "Armadura de latao":[
        "dano":0,
        "durabilidade":10,
        "defesa":30,
        "preco":100
    ],
    "Lanca inconvenientemente curta":[
        "dano":20,
        "durabilidade":10,
        "defesa":0,
        "preco":40
    ],
    "Cabeca de ogro decorativa":[
        "dano":0,
        "durabilidade":0,
        "defesa":0,
        "preco":50
    ],
    "Martelo de forja para anoes":[
        "dano":10,
        "durabilidade":100,
        "defesa":5,
        "preco":10
    ],
    "Flecha":[
        "dano":5,
        "durabilidade":1,
        "defesa":0,
        "preco":2
    ]
]
while true{
    print("---MENU---")
    print("1-Abrir Inventário")
    print("2-Ver Loja")
    print("3-Comprar itens")
    print("4-Informações")
    print("5-Sair")
    let input = Int(readLine() ?? "") ?? 0
    switch input{
    case 1:
        print(abririnventario())
    case 2:
        print(abrirloja())
    case 3:
        print(compra())
    case 4:
        print(info())
    case 5:
        print("Volte mais tarde, aventureiro!")
        exit(0)
    default:
        print("Insira um dos números do menu")
    }
}
func abrirloja(){
    print("---LOJA---")
    for (item,stats) in loja{
        print("\(item)\n DANO: \(stats["dano"] ?? 0)\n DURABILIDADE: \(stats["durabilidade"] ?? 0)\n DEFESA: \(stats["defesa"] ?? 0)")
    }
}
func abririnventario(){
    print("---INVENTÁRIO---")
    if inventario.isEmpty{
        print("O inventário está vazio.")
    }else{
        for i in inventario{
            print(i)
        }
    }
}
func info(){
    print("---INFORMAÇÕES---")
    print("Dano total: \(dano)")
    print("Defesa total: \(defesa)")
    print("Quantidade de moedas: \(moedas)")
}
func compra(){
    print("---COMPRA---")
    print("Deseja comprar:")
    for (item,stats) in loja{
        print("\(item), \(stats["preco"] ?? 0) moedas")
    }
    let itemcompra=readLine() ?? ""
    for (item,stats) in loja{
        let preco=stats["preco"] ?? 0
        let danos=stats["dano"] ?? 0
        let defesas=stats["defesa"] ?? 0
        switch itemcompra{
        case item:
            if (moedas-preco>=0){
                moedas-=preco
                inventario.append(item)
                dano+=(danos)
                defesa+=(defesas)
                print("Compra feita com sucesso! Você agora tem \(moedas) moedas!")
            }else{
                print("Você não tem dinheiro suficicente.")
            }
        default:
            continue
        }
    }
}
