/* 
    1. Wyświetl wszystkie wydatki uzytkownika filip@email.pl. Uzyj w warunku WHERE adres email a nie ID.

    SELECT u.Id as UserId, u.Email, e.*
    FROM Expenses e
    JOIN Users u on e.UserId = u.Id
    WHERE u.email = 'filip@email.pl'

    2. Wyświetl wydatki uzytkownika filip@email.pl które pochodzą z paragonu. Uzyj w warunku WHERE adres email a nie ID.
   Wyświetl równiez informacje z paragonu dodanego do wydatku. Oczekiwana struktura:
   UserId, Email, Expense.Title, Expense.TotalAmount, Receipt.Id

    SELECT 
    u.Id as UserId, 
    u.Email as Email, 
    e.title as ExpenseTitle, 
    e.totalamount As ExpenseAmount, 
    r.Id AS ReceiptId
    FROM Expenses e
    JOIN Users u on e.UserId = u.Id
    JOIN Receipts r on r.id = e.ReceiptId 
    WHERE u.email = 'filip@email.pl'

    3. Wypisz wszystkie wydatki z tabeli Expenses oraz połącz dane z tabeli Users oraz Receipts:
      Oczekiwane dane: Users.Id, Users.Email, Expenses.Title, Expenses.TotalAmount, Receipts.Id, Receipts.Date
      UWAGA: Wyświet wszystkie wydatki, nawet jezeli nie pochodzą ze zdjęcia paragonu 
    
    SELECT u.Id, u.Email, e.Title, e.TotalAmount,r.Id, r.Date
    FROM Expenses e
    JOIN Users u on u.Id = e.UserId
    LEFT JOIN Receipts r ON r.Id = e.ReceiptId

    4. SELECT column_name(s)
       FROM table_name
       WHERE condition
       GROUP BY column_name(s)
       ORDER BY column_name(s);

       SELECT r.Date, COUNT(r.Id) as NumberOfReceipts, SUM(r.Amount) as TotalAmount
       FROM Receipts r
       GROUP BY r.Date
       ORDER BY r.Date DESC 

    5. Wypisz sumę wydatków per kategoria. Oczekiwane dane Suma, Nazwa kategorii:

    SELECT SUM(e.totalamount), c.Name
    FROM Expenses e
    LEFT JOIN Categories c on e.categoryid = c.Id
    GROUP BY c.name

    SELECT SUM(e.totalamount), c.Name
    FROM Expenses e
    Right JOIN Categories c on e.categoryid = c.Id
    GROUP BY c.name

    SELECT SUM(e.totalamount), c.Name
    FROM Expenses e
    FULL OUTER JOIN Categories c on e.categoryid = c.Id
    GROUP BY c.name

    SELECT SUM(e.totalamount), c.Name
    FROM Categories c
    LEFT JOIN Expenses e on e.categoryid = c.Id
    GROUP BY c.name

    6. UPDATE table_name
       SET column1 = value1, column2 = value2, ...
       WHERE condition;

       UPDATE Categories
       SET Name = 'Inne'
       WHERE Name = 'Reszta'

    7. DELETE FROM table_name WHERE condition;

       DELETE FROM Categories
       WHERE Name = 'Reszta'

    8. Podlicz ile wydali uzytkownicy w kazdym ze sklepów. Oczekiwane dane: Seller, TotalAmount

      SELECT e.Seller, SUM(e.totalamount) as TotalAmount
      FROM Expenses e
      WHERE e.seller is not null
      GROUP BY e.seller
      ORDER BY TotalAmount desc

    9. Wykryj te paragony i wypisz (Receipts) których suma pozycji (Expenses.TotalAmount) nie sumuje się do Receipts.Amount. 
   Kwota odczytana na paragonie daje inną kwote niz ta która wynika z encji Wydatki ( Expenses ) przypisanej do danego paragonu.

    SELECT e.receiptid, SUM(e.totalamount) as TotalFromExpenses, r.Amount as TotalFromReceipt
    FROM Expenses e
    JOIN Receipts r on r.Id = e.ReceiptId
    WHERE e.Receiptid IS NOT NULL
    GROUP BY e.ReceiptId, r.Amount
    HAVING SUM(e.totalamount) !=  r.Amount

    10. 
 */