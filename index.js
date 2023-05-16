import express from "express";
import cors from 'cors';
import ticketRouter from './routes/ticket.js'

const app = express();
const port = 8000;

app.use(cors({
  origin: 'http://localhost:3000'
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/ticket', ticketRouter) 

app.get('/', (req, res) => {
  res.send(`Server Run on ${port}`)
});

app.listen(port, () => console.log(`Server Run on ${port}`));
