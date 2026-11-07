-- Fake scans
INSERT INTO scans (file_name, file_type) VALUES
('refund_policy_2026.pdf', 'pdf'),
('website_returns.md', 'md'),
('iot_sensor_manual.pdf', 'pdf'),
('gateway_config.txt', 'txt');

-- Fake contradictions
INSERT INTO contradictions
(scan_id, topic, source_a, source_b, value_a, value_b, severity, confidence, status)
VALUES
(1, 'Refund period',
 'Customers may request a refund within 30 days.',
 'Refund requests must be submitted within 14 days.',
 '30 days', '14 days', 'Critical', 0.94, 'Open'),

(2, 'Registration deadline',
 'Course registration closes on Wednesday.',
 'Students can register until Friday.',
 'Wednesday', 'Friday', 'Moderate', 0.88, 'Open'),

(3, 'Sensor polling frequency',
 'The sensor sends data every 60 seconds.',
 'The gateway timeout limit is 30 seconds.',
 '60 seconds', '30 seconds', 'Critical', 0.91, 'Open'),

(4, 'Java version',
 'The API requires Java 17 or higher.',
 'The production server runs Java 11.',
 'Java 17', 'Java 11', 'Moderate', 0.85, 'Open'),

(1, 'Support hours',
 'Support is available from 9 AM to 6 PM.',
 'Support is available from 10 AM to 5 PM.',
 '9 AM - 6 PM', '10 AM - 5 PM', 'Minor', 0.72, 'Resolved');

-- Fake audit entry
INSERT INTO audit_log (contradiction_id, action, action_by) VALUES
(5, 'Mark Resolved', 'suravi');
