package com.theefesigner.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TaskController {

    @GetMapping("/")
    public String homePage() {
        return """
                <html>
                    <head>
                        <title>Thee Fesigner Maven App</title>
                        <style>
                            body {
                                font-family: Arial, sans-serif;
                                text-align: center;
                                margin-top: 100px;
                                background-color: #f7f7f7;
                            }
                            h1 {
                                color: #ff7f00;
                            }
                            button {
                                background-color: #ff7f00;
                                color: white;
                                padding: 12px 24px;
                                border: none;
                                border-radius: 6px;
                                font-size: 16px;
                                cursor: pointer;
                                transition: 0.3s;
                            }
                            button:hover {
                                background-color: #e56e00;
                            }
                        </style>
                    </head>
                    <body>
                        <h1>Welcome to my MAVEN Test Application!</h1>
                        <p>📞 Contact: +237695099997</p>
                        <button onclick="showMessage()">Click Me</button>
                        <p id="message"></p>

                        <script>
                            function showMessage() {
                                document.getElementById('message').innerHTML = 
                                    '✅ Thanks for clicking! Have a great day from Taku Richard Devops Engineer';
                            }
                        </script>
                    </body>
                </html>
                """;
    }
}

