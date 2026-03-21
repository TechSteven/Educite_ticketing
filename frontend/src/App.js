import React, { useEffect, useState } from 'react';
import './App.css';

function App() {
  const [authStatus, setAuthStatus] = useState("Loading...");
  const [ticketStatus, setTicketStatus] = useState("Loading...");
  const [notifyStatus, setNotifyStatus] = useState("Loading...");

  useEffect(() => {
    // Fetch from Auth Service (8001)
    fetch("http://localhost:8001/health/")
      .then(res => res.json())
      .then(data => setAuthStatus(data.service + ": " + data.status))
      .catch(() => setAuthStatus("Auth Service Offline"));

    // Fetch from Ticket Service (8002)
    fetch("http://localhost:8002/health/")
      .then(res => res.json())
      .then(data => setTicketStatus(data.service + ": " + data.status))
      .catch(() => setTicketStatus("Ticket Service Offline"));

    // Fetch from Notification Service (8003)
    fetch("http://localhost:8003/health/")
      .then(res => res.json())
      .then(data => setNotifyStatus(data.service + ": " + data.status))
      .catch(() => setNotifyStatus("Notification Service Offline"));
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <h1>Educite tickets</h1>
        <div style={{ border: '1px solid white', padding: '20px', borderRadius: '10px' }}>
          <p>🔐 {authStatus}</p>
          <p>🎫 {ticketStatus}</p>
          <p>📩 {notifyStatus}</p>
        </div>
      </header>
    </div>
  );
}

export default App;