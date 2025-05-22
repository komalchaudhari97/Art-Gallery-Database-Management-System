SQL Implementation for New Functionalities
1. Online Rating System
Description:
Allows customers to share reviews and ratings of artists and their artworks.
SELECT 
    r.ReviewID, 
    r.ReviewerName, 
    r.Rating, 
    r.Comment, 
    w.WorkTitle, 
    a.ArtistName
FROM 
    OnlineRating r
JOIN 
    Work w ON r.WorkID = w.WorkID
JOIN 
    Artist a ON r.ArtistID = a.ArtistID;

2. Commission for Salesperson
Description:
Tracks commissions earned by employees based on artwork sold.
SELECT 
    e.EmpFirstName, 
    e.EmpLastName, 
    SUM(c.TotalCommission) AS TotalCommissionEarned
FROM 
    Commission c
JOIN 
    Employee e ON c.EmployeeID = e.EmployeeID
GROUP BY 
    c.EmployeeID;

3. Auction Process
Description:
Captures auction bids conducted by employees for customers on exclusive artwork.
SELECT 
    a.AuctionID,
    e.EmpFirstName AS EmployeeName,
    c.CustFirstName AS CustomerName,
    w.WorkTitle,
    a.BidPrice
FROM 
    AuctionProcess a
JOIN 
    Employee e ON a.EmployeeID = e.EmployeeID
JOIN 
    Customer c ON a.CustomerID = c.CustomerID
JOIN 
    Work w ON a.WorkID = w.WorkID;

4. Visitor Booking System
Description:
Manages customer bookings for art shows happening on specific dates.
SELECT 
    v.CustomerID,
    cu.CustFirstName,
    v.BookingDate,
    v.VisitingDate,
    s.Title AS ShowTitle
FROM 
    VisitorBooking v
JOIN 
    Customer cu ON v.CustomerID = cu.CustomerID
JOIN 
    ArtShowSchedule s ON v.ShowID = s.ShowID
WHERE 
    v.VisitingDate >= CURDATE();

5. Employee Table
Description:
Stores employee details, used to track auctions and commissions.
SELECT 
    EmployeeID, 
    EmpFirstName, 
    EmpLastName, 
    Designation
FROM 
    Employee
WHERE 
    Designation = 'Salesperson';

6. Art Show Schedule
Description:
Maintains upcoming and current art shows with start/end dates and ticket pricing.
SELECT 
    ShowID, 
    Title, 
    ShowStartDate, 
    ShowEndDate, 
    TicketPrice
FROM 
    ArtShowSchedule
WHERE 
    ShowEndDate >= CURDATE()
ORDER BY 
    ShowStartDate ASC;

