select * from event_details

--1)
CREATE TABLE events AS
SELECT DISTINCT
    event_id,
    event_name,
    event_date,
    start_time,
    end_time,
    venue_id
FROM event_details;

select * from events

--2)
CREATE TABLE venues AS
SELECT DISTINCT
    venue_id,
    venue_name,
    venue_capacity,
    venue_address
FROM event_details;

--3)
CREATE TABLE speakers AS
SELECT DISTINCT
    speaker_id,
    speaker_name,
    speaker_expertise,
    speaker_bio
FROM event_details;

--4)
CREATE TABLE attendees AS
SELECT DISTINCT
    attendee_id,
    attendee_name,
    attendee_email,
    dietary_preference
FROM event_details;

--5)
CREATE TABLE event_registration AS
SELECT
    event_id,
    attendee_id,
    registration_date,
    registration_type,
    ticket_price
FROM event_details;





