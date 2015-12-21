//
//  TranslationDictionary.swift
//  SwipeSpanish
//
//  Created by Cindy Le on 12/18/15.
//  Copyright © 2015 Cobo, Javier. All rights reserved.
//

import Foundation

//Struct where our Words array lives

struct Words {
    
let wordsArray = [
    ["el águila","eagle"  ],
    ["la alondra","lark"  ],
    ["el antílope","antelope"  ],
    ["la araña","spider"  ],
    ["la ardilla","squirrel"  ],
    ["el arenque","herring"  ],
    ["el atún","tuna"  ],
    ["el avestruz","ostrich"  ],
    ["la avispa","wasp"  ],
    ["la ballena","whale"  ],
    ["el bisonte","bison"  ],
    ["el bogavante","lobster"  ],
    ["el búfalo","buffalo"  ],
    ["el búho","owl"  ],
    ["el burro","donkey"  ],
    ["el caballo","horse"  ],
    ["la cabra","goat"  ],
    ["el cabrito","kid"  ],
    ["el calamar","squid"  ],
    ["el camaleón","chameleon"  ],
    ["el camello","camel"  ],
    ["el cangrejo","crab"  ],
    ["el canguro","kangaroo"  ],
    ["el caracol","snail"  ],
    ["la carpa","carp"  ],
    ["el castor","beaver"  ],
    ["la cebra","zebra"  ],
    ["el cerdo","pig"  ],
    ["el ciervo","deer, stag"  ],
    ["el ciervo volante","stag beetle"  ],
    ["la cigüeña","stork"  ],
    ["el cisne","swan"  ],
    ["la cobaya","guinea pig"  ],
    ["el cocodrilo","crocodile"  ],
    ["el cochinillo","piglet"  ],
    ["el colibri","hummingbird"  ],
    ["el conejo","rabbit"  ],
    ["el corzo","roe"  ],
    ["la cucaracha","cockroach"  ],
    ["el cuco","cuckoo"  ],
    ["el cuervo","raven"  ],
    ["el chacal","jackal"  ],
    ["el chimpancé","chimpanzee"  ],
    ["el chinche","bedbug"  ],
    ["el delfín","dolphin"  ],
    ["el elefante","elephant"  ],
    ["el erizo","hedgehog"  ],
    ["el escorpión","scorpion"  ],
    ["el estornino","starling"  ],
    ["el faisán","pheasant"  ],
    ["la foca","seal"  ],
    ["la gallina","hen"  ],
    ["el gallo","cock"  ],
    ["la gamuza","chamois"  ],
    ["la garrapata","tick"  ],
    ["el gato","cat"  ],
    ["la gaviota","seagull"  ],
    ["la golondrina","swallow"  ],
    ["el gorila","gorilla"  ],
    ["el gorrión","sparrow"  ],
    ["el grillo","cricket"  ],
    ["la grulla","crane"  ],
    ["el halcón","falcon"  ],
    ["el hámster","hamster"  ],
    ["la hiena","hyena"  ],
    ["el hipopótamo","hippo"  ],
    ["la hormiga","ant"  ],
    ["el hurón","ferret"  ],
    ["el jabalí","boar"  ],
    ["el jaguar","jaguar"  ],
    ["la jirafa","giraffe"  ],
    ["el lagarto","lizard"  ],
    ["la langosta","locust"  ],
    ["el león","lion"  ],
    ["el lince","lynx"  ],
    ["el lobo","wolf"  ],
    ["el loro","parrot"  ],
    ["el lucio","pike"  ],
    ["el mapache","raccoon"  ],
    ["la mariposa","butterfly"  ],
    ["la medusa","jellyfish"  ],
    ["la mosca","fly"  ],
    ["el mosquito","mosquito"  ],
    ["el murciélago","bat"  ],
    ["la nutria","otter"  ],
    ["la oca","goose"  ],
    ["la onza","cheetah"  ],
    ["el oso","bear"  ],
    ["el oso polar","polar bear"  ],
    ["la ostra","oyster"  ],
    ["la oveja","sheep"  ],
    ["el pájaro","bird"  ],
    ["la paloma","dove"  ],
    ["la panda","panda bear"  ],
    ["la pantera","panther"  ],
    ["el paro","tit"  ],
    ["el pato","duck"  ],
    ["el pavo","turkey"  ],
    ["el pavón","peacock"  ],
    ["el pelícano","pelican"  ],
    ["el perezoso","sloth"  ],
    ["el perro","dog"  ],
    ["el pez","fish"  ],
    ["el pingüino","penguin"  ],
    ["el piojo","louse"  ],
    ["el pulpo","octopus"  ],
    ["el pollo","chicken"  ],
    ["el poni","pony"  ],
    ["el potro","foal"  ],
    ["la rana","frog"  ],
    ["la rata","rat"  ],
    ["el ratón","mouse"  ],
    ["la raya","ray fish"  ],
    ["el renacuajo","tadpole"  ],
    ["el rinoceronte","rhinoceros"  ],
    ["el ruiseñor","nightingale"  ],
    ["el salmón","salmon"  ],
    ["el sapo","toad"  ],
    ["la serpiente","snake"  ],
    ["el ternero","calf"  ],
    ["el tiburón","shark"  ],
    ["el tigre","tiger"  ],
    ["el topo","mole"  ],
    ["el toro","bull"  ],
    ["la tortuga","turtle"  ],
    ["la trucha","trout"  ],
    ["la vaca","cow"  ],
    ["la víbora","viper"  ],
    ["la yegua","mare"  ],
    ["el zorro","fox"  ],
]

//randomArray function counts the number of arrays within wordsArray, then chooses a random number from that count, then assigns randomPair with the chosen random array, to be passed to first view controller

    func randomArray() -> [String]{
        
        let arrayCount = UInt32(wordsArray.count)
        let randomNumber = Int(arc4random_uniform(arrayCount))
        let randomPair = self.wordsArray[randomNumber]
        
//        print(randomPair)
        
        return randomPair
        

/* FAILED ATTEMPTS AT PASSING SPANISH AND ENGLISH IN THIS STRUCT TO VIEW CONTROLLER*/
        
//        let spanish = randomPair.0
//        print(spanish)
//        let english = randomArray().1
//        print(english)
//        return (spanish,english)
        
    }

//    func showEnglish() -> String{
//        var monkey =
//        
//        print(randomArray()[1])
//        return randomArray()[1]
//        
//        
//    }
//    
//    func showSpanish() -> String{
//        let spanishWord = randomArray()[0]
//        
//        print(spanishWord)
//        
//        return spanishWord
//    }
    
}











