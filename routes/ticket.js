import express from "express";
import { createTicket, updateTicket, updateTicketStatus, getTicket, getTicketById} from "../controllers/ticketController.js";

const router = express.Router()

router.post('/createTicket', createTicket)
router.put('/updateTicket', updateTicket)
router.put('/updateTicketStatus', updateTicketStatus)
router.get('/getTicket', getTicket)
router.get('/getTicketById/:id', getTicketById)

export default router