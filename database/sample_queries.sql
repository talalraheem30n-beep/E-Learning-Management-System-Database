SELECT 
    Course_ID, 
    Course_Title, 
    Level, 
    Duration, 
    FEE
FROM COURSE
ORDER BY FEE DESC;

SELECT 
    Course_ID, 
    Course_Title, 
    Duration, 
    FEE
FROM COURSE
WHERE Level = 'Intermediate' AND FEE < 200.00;

SELECT 
    c.Course_ID, 
    c.Course_Title, 
    COUNT(e.Student_ID) AS Total_Enrollments
FROM COURSE c
INNER JOIN ENROLLMENT e ON c.Course_ID = e.Course_ID
GROUP BY c.Course_ID, c.Course_Title
ORDER BY Total_Enrollments DESC;

SELECT 
    c.Course_ID, 
    c.Course_Title, 
    AVG(e.Progress) AS Average_Progress
FROM COURSE c
INNER JOIN ENROLLMENT e ON c.Course_ID = e.Course_ID
GROUP BY c.Course_ID, c.Course_Title
HAVING Average_Progress > 50.00
ORDER BY Average_Progress DESC;

SELECT 
    e.Enrollment_ID, 
    CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name, 
    c.Course_Title, 
    e.Date AS Enrollment_Date, 
    e.Progress, 
    e.Grade
FROM ENROLLMENT e
INNER JOIN STUDENT s ON e.Student_ID = s.Student_ID
INNER JOIN COURSE c ON e.Course_ID = c.Course_ID
ORDER BY e.Enrollment_ID;

SELECT 
    i.Instructor_ID, 
    CONCAT(i.First_Name, ' ', i.Last_Name) AS Instructor_Name, 
    i.Specialization,
    COUNT(c.Course_ID) AS Total_Courses_Taught
FROM INSTRUCTOR i
LEFT JOIN COURSE c ON i.Instructor_ID = c.Instructor_ID
GROUP BY i.Instructor_ID, i.First_Name, i.Last_Name, i.Specialization
ORDER BY Total_Courses_Taught DESC;

SELECT 
    CONCAT(i.First_Name, ' ', i.Last_Name) AS Instructor_Name, 
    i.Specialization, 
    ie.Email AS Instructor_Email
FROM INSTRUCTOR i
INNER JOIN INSTRUCTOR_EMAIL ie ON i.Instructor_ID = ie.Instructor_ID
ORDER BY Instructor_Name ASC;

SELECT 
    c.Course_Title, 
    l.Sequence_No, 
    l.Lesson_Title, 
    l.Content_Type, 
    l.Duration
FROM COURSE c
INNER JOIN LESSON l ON c.Course_ID = l.Course_ID
ORDER BY c.Course_Title ASC, l.Sequence_No ASC;

SELECT 
    c.Course_ID, 
    c.Course_Title
FROM COURSE c
LEFT JOIN ASSIGNMENT a ON c.Course_ID = a.Course_ID
WHERE a.Assignment_Code IS NULL;

SELECT 
    sub.Submission_ID, 
    CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name, 
    a.Title AS Assignment_Title, 
    sub.Submission_Date, 
    a.Deadline AS Assignment_Deadline
FROM ASSIGNMENT_SUBMISSION sub
INNER JOIN STUDENT s ON sub.Student_ID = s.Student_ID
INNER JOIN ASSIGNMENT a ON sub.Assignment_Code = a.Assignment_Code
ORDER BY sub.Submission_Date DESC;

SELECT 
    qa.Attempt_ID, 
    CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name, 
    q.Quiz_Title, 
    qa.Score AS Student_Score, 
    q.Total_Marks, 
    q.Passing_Marks,
    CASE 
        WHEN qa.Score >= q.Passing_Marks THEN 'Pass' 
        ELSE 'Fail' 
    END AS Quiz_Result
FROM QUIZ_ATTEMPT qa
INNER JOIN STUDENT s ON qa.Student_ID = s.Student_ID
INNER JOIN QUIZ q ON qa.Quiz_ID = q.Quiz_ID
ORDER BY qa.Attempt_ID;

SELECT 
    s.Student_ID, 
    CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name, 
    AVG(qa.Score) AS Average_Quiz_Score
FROM QUIZ_ATTEMPT qa
INNER JOIN STUDENT s ON qa.Student_ID = s.Student_ID
GROUP BY s.Student_ID, s.First_Name, s.Last_Name
ORDER BY Average_Quiz_Score DESC
LIMIT 5;

SELECT 
    Transaction_Status, 
    COUNT(Slip_id) AS Transaction_Count, 
    SUM(Amount) AS Total_Amount
FROM PAYMENT
GROUP BY Transaction_Status
ORDER BY Total_Amount DESC;

SELECT 
    s.Student_ID, 
    CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name, 
    SUM(p.Amount) AS Total_Pending_Amount
FROM PAYMENT p
INNER JOIN STUDENT s ON p.Student_ID = s.Student_ID
WHERE p.Transaction_Status = 'Pending'
GROUP BY s.Student_ID, s.First_Name, s.Last_Name
ORDER BY Total_Pending_Amount DESC;

SELECT 
    s.Student_ID, 
    CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name
FROM STUDENT s
LEFT JOIN PAYMENT p ON s.Student_ID = p.Student_ID
WHERE p.Slip_id IS NULL;

SELECT 
    c.Course_Title, 
    COUNT(f.Feedback_ID) AS Total_Feedback_Entries, 
    AVG(f.Rating) AS Average_Rating
FROM FEEDBACK f
INNER JOIN COURSE c ON f.Course_ID = c.Course_ID
GROUP BY c.Course_ID, c.Course_Title
ORDER BY Average_Rating DESC, Total_Feedback_Entries DESC;

SELECT 
    ls.Session_Title, 
    ls.Date AS Session_Date, 
    ls.Time AS Session_Time, 
    CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name, 
    la.Attendance_Date
FROM LIVE_ATTENDANCE la
INNER JOIN STUDENT s ON la.Student_ID = s.Student_ID
INNER JOIN LIVESESSION ls ON la.Session_ID = ls.Session_ID
ORDER BY ls.Date DESC, ls.Time DESC, Student_Name ASC;

SELECT 
    n.UUID AS Notification_ID, 
    CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name, 
    n.Type AS Notification_Type, 
    n.Message, 
    n.Date AS Sent_Date
FROM NOTIFICATION n
INNER JOIN STUDENT s ON n.Student_ID = s.Student_ID
ORDER BY n.Date DESC;

SELECT 
    cert.Certificate_ID, 
    CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name, 
    cert.Certificate_Code, 
    cert.Verification_No, 
    cert.Grade, 
    cert.Issue_Date
FROM CERTIFICATE cert
INNER JOIN STUDENT s ON cert.Student_ID = s.Student_ID
ORDER BY cert.Issue_Date DESC;

SELECT 
    s.Student_ID, 
    CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name, 
    s.Date_of_Birth, 
    se.Email AS Student_Email, 
    sp.Phone_No AS Student_Phone
FROM STUDENT s
LEFT JOIN STUDENT_EMAIL se ON s.Student_ID = se.Student_ID
LEFT JOIN STUDENT_PHONE sp ON s.Student_ID = sp.Student_ID
ORDER BY s.Student_ID ASC;

