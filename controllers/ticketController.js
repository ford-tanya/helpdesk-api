import connection from "../connect.js";
import moment from "moment/moment.js";

// Get all tickets
export const getTicket = async (req, res) => {
    const sql = `
        SELECT ticket.ticket_id, ticket.title, ticket.update_time, status.status_name
        FROM ticket
        INNER JOIN status ON ticket.status_id = status.status_id
        ORDER BY ticket.update_time DESC;
    `;
    
    try {
        const [result] = await connection.query(sql);
        if (result.length !== 0) {
            return res.status(200).send({ status: 'success', data: result });
        }
        res.status(200).send({ status: 'success', message: 'No data found', data: [] });
        } catch (error) {
        res.status(500).send({ status: 'error', message: error.message });
    }
}

// Get ticket by id
export const getTicketById = async (req, res) => {
    const ticketId = req.params.id;
    const sql = `SELECT ticket.ticket_id, ticket.title, ticket.description, ticket.contact, ticket.created_time, ticket.update_time, status.status_name 
        FROM ticket 
        INNER JOIN status 
        ON ticket.status_id = status.status_id
        WHERE ticket.ticket_id = '${ticketId}'`;
  
    try {
      const [result] = await connection.query(sql);
      if (result.length > 0) {
        return res.status(200).send({ status: 'success', data: result[0] });
      }
      return res.status(404).send({ status: 'error', message: `Ticket ${ticketId} not found` });
    } catch (error) {
      res.status(500).send({ status: 'error', error });
    }
  };

// Create a ticket
export const createTicket = async (req, res) => {
    const { title, description, contact, status_id } = req.body;
    const created_time = moment().format();
    const update_time = created_time;
    const sql = `INSERT INTO ticket (title, description, contact, created_time, update_time, status_id)
                VALUES (?, ?, ?, ?, ?, ?)`;
    const values = [title, description, contact, created_time, update_time, status_id];

    try {
        const [result] = await connection.query(sql, values);
        if (result.affectedRows > 0) {
        const data = {
            ticket_id: result.insertId,
            title: title,
            description: description,
            contact: contact,
            created_time: created_time,
            update_time: update_time,
            status_id: status_id,
        };
        return res.status(201).send({ status: 'success', data: data });
        }
        return res.status(500).send({ status: 'error', message: 'Failed to insert data.' });
    } catch (error) {
        res.status(500).send({ status: 'error', error });
    }
};

// Update information of a ticket
export const updateTicket = async (req, res) => {
    const { ticket_id, title, description, contact } = req.body;
    const description_format = description.replace(/'/g, "''");
    const update_time =  moment().format();
    const sql = `UPDATE ticket SET title = '${title}', description = '${description_format}', contact = '${contact}', update_time = '${update_time}' WHERE ticket_id = ${ticket_id}`;
    
    try {
        const [result] = await connection.query(sql);
        if (result.affectedRows > 0) {
        return res.status(200).send({ status: 'success', message: `Ticket ${ticket_id} updated` });
    }
    return res.status(404).send({ status: 'error', message: `Ticket ${ticket_id} not found` });
    } catch (error) {
        res.status(500).send({ status: 'error', error });
    }
};

// Update a ticket status
export const updateTicketStatus = async (req, res) => {
    const { ticket_id, status_id } = req.body;

    const update_time = moment().format();
    const sql = `UPDATE ticket SET status_id = '${status_id}', update_time = '${update_time}' WHERE ticket_id = '${ticket_id}'`;

    try {
        const [result] = await connection.query(sql);
        if (result.affectedRows > 0) {
            return res.status(200).send({ status: 'success', message: `Ticket ${ticket_id} status updated to ${status_id}`});
        }
        return res.status(404).send({ status: 'error', message: `Ticket ${ticket_id} not found` });
    } catch (error) {
        res.status(500).send({ status: 'error', error });
    }
};
