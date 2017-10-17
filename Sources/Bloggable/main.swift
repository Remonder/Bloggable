//
//  main.swift
//  Bloggable
//
//  Created by Steffen Ryll on 17.10.17.
//

import Commandant
import Result

let commandRegistry = CommandRegistry<String>()
let helpCommand = HelpCommand(registry: commandRegistry)
commandRegistry.register(helpCommand)
commandRegistry.register(CreateTablesCommand())
commandRegistry.register(RunServerCommand())
commandRegistry.main(defaultVerb: helpCommand.verb) { error in
    print(error)
}
