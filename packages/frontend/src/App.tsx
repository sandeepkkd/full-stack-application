import React, { useState, useEffect } from 'react';

interface Customer {
  id: number;
  name: string;
}

function App() {
  const [customers, setCustomers] = useState<Customer[]>([]);

  useEffect(() => {
    fetch('/api/customers')
      .then(response => response.json())
      .then(data => setCustomers(data));
  }, []);

  return (
    <div className="App">
      <h1>Customer Portal</h1>
      <ul>
        {customers.map(customer => (
          <li key={customer.id}>{customer.name}</li>
        ))}
      </ul>
    </div>
  );
}

export default App;
