
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>ChatGPT Clone</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f7f9fc;
      margin: 0;
      padding: 0;
    }
    #chatContainer {
      width: 80%;
      margin: 50px auto;
      border: 1px solid #ccc;
      padding: 20px;
      background-color: #fff;
    }
    #chatBox {
      height: 400px;
      overflow-y: scroll;
      border: 1px solid #ccc;
      padding: 10px;
    }
    #userInput {
      width: 80%;
      padding: 10px;
    }
    #sendBtn {
      padding: 10px;
    }
  </style>
</head>
<body>
  <div id="chatContainer">
    <h2>ChatGPT Clone</h2>
    <div id="chatBox"></div>
    <input type="text" id="userInput" placeholder="Type your message here..." />
    <button id="sendBtn">Send</button>
  </div>

  <script>
    const chatBox = document.getElementById('chatBox');
    const userInput = document.getElementById('userInput');
    const sendBtn = document.getElementById('sendBtn');

    sendBtn.addEventListener('click', async () => {
      const message = userInput.value;
      chatBox.innerHTML += `<p><strong>You:</strong> ${message}</p>`;
      userInput.value = '';

      const response = await fetch('https://api.openai.com/v1/chat/completions', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer YOUR_API_KEY'
        },
        body: JSON.stringify({
          model: 'gpt-3.5-turbo',
          messages: [{ role: 'user', content: message }]
        })
      });

      const data = await response.json();
      const reply = data.choices[0].message.content;
      chatBox.innerHTML += `<p><strong>ChatGPT:</strong> ${reply}</p>`;
    });
  </script>
</body>
</html>

