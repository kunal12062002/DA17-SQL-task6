--1
SELECT
    e.event_name,
    v.venue_name
FROM
    events as e
INNER JOIN
    venues as v ON e.venue_id = v.venue_id
ORDER BY
    e.event_name;

--2
SELECT
    e.event_name,
    v.venue_name
FROM
    events e
LEFT JOIN
    venues v ON e.venue_id = v.venue_id;

--3
SELECT
    a.attendee_name,
    e.event_name,
    e.event_date
FROM
    attendees a
INNER JOIN
    event_registrations er ON a.attendee_id = er.attendee_id
INNER JOIN
    events e ON er.event_id = e.event_id
ORDER BY a.attendee_name, e.event_date;

--4
SELECT
    a.attendee_name,
    e.event_name
FROM
    attendees a
LEFT JOIN
    event_registrations er ON a.attendee_id = er.attendee_id
LEFT JOIN
    events e ON er.event_id = e.event_id;

--5
SELECT
    e.event_name,
    COUNT(er.attendee_id) AS attendee_count
FROM
    events e
INNER JOIN
    event_registrations er ON e.event_id = er.event_id
GROUP BY
    e.event_name
ORDER BY
    attendee_count DESC;

--6	
SELECT
    e.event_name,
    COUNT(er.attendee_id) AS attendee_count
FROM
    events e
LEFT JOIN
    event_registrations er ON e.event_id = er.event_id
GROUP BY
    e.event_name
ORDER BY
    attendee_count DESC;

--7
select e.event_name,sum(er.ticket_price) as total_ticket_revenue from events as e
left join event_registration as er
on e.event_id = er.event_id
group by e.event_name
having sum(er.ticket_price) > (SELECT MAX(ticket_price) FROM event_registration)
order by total_ticket_revenue DESC;

--8
select * from events as e
left join venues as v
on e.venue_id = v.venue_id
where v.venue_capacity > 500
order by v.venue_capacity;

--9
SELECT
    e.event_name,
    v.venue_name,
    e.event_date,
    COUNT(er.attendee_id) AS attendee_count
FROM
    events e
INNER JOIN
    venues v ON e.venue_id = v.venue_id
INNER JOIN
    event_registrations er ON e.event_id = er.event_id
GROUP BY
    e.event_name,
    v.venue_name,
    e.event_date
ORDER BY
    e.event_date,
    attendee_count DESC;

--10
SELECT
    e.event_name,
    COUNT(er.attendee_id) AS attendee_count,
    AVG(er.ticket_price) AS avg_ticket_price,
    MAX(er.ticket_price) AS max_ticket_price,
    MIN(er.ticket_price) AS min_ticket_price
FROM
    events e
INNER JOIN
    event_registrations er ON e.event_id = er.event_id
GROUP BY
    e.event_name
ORDER by
    attendee_count DESC;







