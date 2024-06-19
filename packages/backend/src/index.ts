import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';

const app = express();
app.use(bodyParser.json());
app.use(cors());

interface Customer {
  id: number;
  name: string;
}

const customers: Customer[] = [
  { id: 1, name: 'John Doe' },
  { id: 2, name: 'Jane Smith' }
];

app.get('/',(req,res)=>{
  res.json({testing : "testing reponse one two three"})
})

app.get('/api/customers', (req, res) => {
  res.json(customers);
});

app.listen(5000, () => {
  console.log('Server is running on port 5000');
});
