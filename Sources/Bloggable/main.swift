//
//  main.swift
//  Bloggable
//
//  Created by Steffen Ryll on 17.10.17.
//

import Kitura

// Create a new router
let router = Router()

// Handle HTTP GET requests to /
router.get("/") { _, response, next in
    response.send("Hello, World!")
    next()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8080, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
