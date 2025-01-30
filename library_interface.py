import tkinter as tk
import mysql.connector

global user,password,choice,operation,table_choice,header_choice,custom,insert

def initialize_connection(u, p):
        my_connect = mysql.connector.connect(host="localhost",username=u,passwd=p,database="library")
        return my_connect

def init_menu(self, clicked, list):        
    drop = tk.OptionMenu(self,clicked,*list)
    drop.config(width=30)
    drop.pack()

def update_database(query):
    my_connect = initialize_connection(user, password)
    conn =  my_connect.cursor()
    conn.execute(query)
    my_connect.commit()

def output_table(self, query, output):
    my_connect = initialize_connection(user, password)
    conn =  my_connect.cursor()
    conn.execute(query)
    headers = conn.column_names

    a=0
    for x in headers:
                e = tk.Label(output,width=10,text=headers[a],borderwidth=2, relief='ridge',anchor='w')
                e.grid(row = 0,column=a)
                a=a+1
    i=1
    for k in conn: 
        for j in range(len(k)):
            e = tk.Entry(output, width=10, fg='white') 
            e.grid(row=i, column=j) 
            e.insert(tk.END, k[j])
        i=i+1
    tk.Button(self,text="Reset",command=self.reset).pack()
    output.mainloop() 

def center_window(width, height):
    x = (root.winfo_screenwidth() // 2) - (width // 2)
    y = (root.winfo_screenheight() // 2) - (height // 2)
    root.geometry(f'{width}x{height}+{x}+{y}')
 
class WelcomeWindow(tk.Frame):
    def __init__(self, master):
        super().__init__()
        self.master = master
        self.master.title("City Library Database")
        center_window(480, 240)
        tk.Label(self, text="LOGIN TO ACCESS LIBRARY DATABASE!").pack(pady=20)

        login_button = tk.Button(self, text="Login", width=10, command=self.open_login_window)
        login_button.pack(padx=50, pady=(50, 0))

        self.pack()
         
    def open_login_window(self):
        for widget in self.winfo_children(): 
            widget.destroy()
        self.destroy()
        LoginWindow(self.master)
 
class LoginWindow(tk.Frame):
    def __init__(self, master):
        super().__init__()
        self.master = master
        self.master.title("Login")
        self.master.resizable(False, False)
        center_window(500, 500)

        tk.Label(self, text="Username:").grid(row=0, column=0)
        self.username_entry = tk.Entry(self)
        self.username_entry.grid(row=0, column=1, padx=5, pady=10)
        tk.Label(self, text="Password:").grid(row=1, column=0)
        self.password_entry = tk.Entry(self, show="*")
        self.password_entry.grid(row=1, column=1, padx=5, pady=10)

        submit_button = tk.Button(self, text="Submit", width=8, command=self.submit)
        submit_button.grid(row=2, column=1, sticky="e", padx=10, pady=(10, 0))
        submit_button = tk.Button(self, text="Back", width=8, command=self.back)
        submit_button.grid(row=2, column=0, sticky="w", padx=10, pady=(10, 0))
        self.pack()      

    def submit(self):   
        global user, password
        user = self.username_entry.get()
        password = self.password_entry.get()
        initialize_connection(user, password)
        for widget in self.winfo_children(): 
            widget.destroy()
        self.destroy()
        QueryInterface(self.master)
 
    def back(self):
        for widget in self.winfo_children(): 
            widget.destroy()
        self.destroy()
        WelcomeWindow(self.master)

class QueryInterface(tk.Frame): 
    def __init__(self, master):
        super().__init__()
        self.master = master
        self.master.title("Login")
        self.master.resizable(True, False)
        center_window(1000, 750)
        
        tk.Label(self, text = "Welcome to the City Library Database.", font=20).pack()
        options=["Search", "Borrow a Book", "Return a Book", "Reserve a Book", "Checked Out", "Stats", "Modify Database", "3rd Deliverable Queries"]  
        self.choice_clicked=tk.StringVar()
        self.choice_clicked.set(" ")   
        init_menu(self,self.choice_clicked,options)
        tk.Button(self,text="Next",command=self.option_operations).pack()
        self.pack()

    def option_operations(self):
        global choice
        choice=self.choice_clicked.get()
        
        if(choice=="Borrow a Book" or choice == "Return a Book" or choice=="Reserve a Book" or choice=="Checked Out"):
            self.option_tables()
        elif(choice=="3rd Deliverable Queries"):
                options=["1st", "2nd", "3rd", "4th", "5th", "6th", "7th" ,"8th" ,"9th" ,"10th"]
                self.op_clicked=tk.StringVar()
                self.op_clicked.set(" ")
                init_menu(self,self.op_clicked,options)
                tk.Button(self,text="Next",command=self.option_tables).pack()
        else:
            tk.Label(self,text="Choose an Operation.").pack()
            if(choice=="Search"):
                options=["Show Table","Show Column","Show Record","Custom/Conditional"]     
            elif(choice=="Stats"):
                options=["Sum","Count","Percentages","Mean","Custom/Conditional"]
            else:
                options=["Insert Row","Update Row(s)","Delete Table","Delete Row(s)","Custom/Conditional"]     
            self.op_clicked=tk.StringVar()
            self.op_clicked.set(" ")
            init_menu(self,self.op_clicked,options)
            tk.Button(self,text="Next",command=self.option_tables).pack()
        self.pack()

    def option_tables(self):
        global operation
        
        if(choice == "Borrow a Book"):
            operation = "Borrow a Book"
            self.generate_table()
        elif(choice == "Return a Book"):
            operation = "Return a Book"
            tk.Label(self,text="Enter User ID:").pack()
            self.uID_entry=tk.Entry(self,width = 30)
            self.uID_entry.pack()  
            tk.Button(self,text="Next",command=self.generate_table).pack()          
        elif(choice=="Reserve a Book"):
            operation="Reserve a Book"
            tk.Label(self,text="Enter User ID:").pack()
            self.uID_entry=tk.Entry(self,width = 30)
            self.uID_entry.pack()  
            tk.Button(self,text="Next",command=self.generate_table).pack() 
        elif(choice=="Checked Out"):
            operation="Checked Out"
            tk.Label(self,text="To see all the books you have checked out, Enter User ID:").pack()
            self.uID_entry=tk.Entry(self,width = 30)
            self.uID_entry.pack()  
            tk.Button(self,text="Next",command=self.generate_table).pack()
        elif(choice=="3rd Deliverable Queries"):
            operation = self.op_clicked.get()
            self.generate_table()
        else:
            operation=self.op_clicked.get() 
            if(operation=="Custom/Conditional"):
                self.custom_query()            
            else:
                tk.Label(self, text = "Choose a Table.").pack()
                tables=["book","librarian","library_member","author","publisher","form","borrowed","reserved"]     
                self.table_clicked=tk.StringVar()
                self.table_clicked.set(" ")
                init_menu(self,self.table_clicked,tables)
                    
                if(operation!="Show Table" and operation!="Delete Table"):
                    tk.Button(self,text="Next",command=self.option_headers).pack()
                else:
                    tk.Button(self,text="Generate",command=self.generate_table).pack()
        self.pack()

    def option_headers(self):
        global table_choice
        table_choice=self.table_clicked.get()  
        if(operation=="Show Record"):
            tk.Label(self, text="INPUT "+table_choice+" ID").pack()
            self.values_entry = tk.Entry(self, width = 50)
            self.values_entry.pack()
            tk.Button( self,text = "Next",command=self.generate_table).pack()  
        elif(operation=="Insert Row"):
            table_values={"book": " (book_ID, book_name, book_edition, genre, copies_available, isBorrowed, author_ID, publisher_ID, form_ID)",
                            "librarian": " (librarian_ID, First_Name, Last_Name, Address, Email, Gender)", 
                            "library_member": " (user_ID, First_Name, Last_Name, Address, Email, Gender, Birthdate, Age, librarian_ID)", 
                            "author": " (author_ID, First_Name, Last_Name, Gender)", 
                            "form": " (form_ID, form_name)",
                            "publisher": " (publisher_ID, publisher_name)",
                            "borrowed": " (book_ID, user_ID, date_borrowed, date_due)",
                            "reserved": " (book_ID, user_ID, reserve_date)"
                        }
            tk.Label(self, text="INSERT VALUES WITH THIS FORMAT " + table_values[table_choice]).pack()
            self.values_entry = tk.Entry(self, width = 50)
            self.values_entry.pack()
            tk.Button( self,text = "Next",command=self.generate_table).pack()  
        elif(operation=="Update Row(s)"):
            tk.Label(self, text = "CHOOSE A HEADER TO UPDATE.").pack()

            header_options = self.headers(table_choice)
            headers = []
            for x in header_options:
                headers.append(x)

            self.header_clicked = tk.StringVar()
            self.header_clicked.set( " " )
            init_menu(self, self.header_clicked, headers)

            tk.Label(self, text="INSERT VALUE(USE FORMAT -- 'value' WHERE 'condition'):").pack()
            self.values_entry = tk.Entry(self, width = 50)
            self.values_entry.pack()
            tk.Button( self,text = "Next",command=self.generate_table).pack()
        elif(operation=="Delete Row(s)"):
            tk.Label(self, text="INSERT VALUE[INPUT COLUMNS OR USE FORMAT --> WHERE 'condition' (ex: WHERE USER_ID=111111)]:").pack()
            self.values_entry = tk.Entry(self, width = 50)
            self.values_entry.pack()
            tk.Button( self,text = "Generate",command=self.generate_table).pack()
        else:
            tk.Label(self,text="Choose a Header.").pack()

            header_options=self.headers(table_choice)
            headers=[]
            for x in header_options:
                headers.append(x)
            
            self.header_clicked=tk.StringVar()
            self.header_clicked.set( " " )
            init_menu(self,self.header_clicked,headers)
            tk.Button(self,text="Generate",command=self.generate_table).pack()
        self.pack()
    
    def custom_query(self):
        tk.Label(self,text="WRITE YOUR OWN STATEMENT QUERY:").pack()
        self.query_entry=tk.Entry(self,width = 30)
        self.query_entry.pack()
        tk.Button(self,text="Generate",command=self.generate_table).pack()
        self.pack()

    def generate_table(self):
        query_chosen=""
        global table_choice,header_choice,custom,insert

        if(operation=="Show Table"):
            win=tk.Tk()
            table_choice=self.table_clicked.get() 
            query_chosen="SELECT * FROM " + table_choice 
            output_table(self, query_chosen, win)
        elif(operation=="Show Record"):
            win=tk.Tk()
            table_choice=self.table_clicked.get()
            insert=self.values_entry.get()
            table_ID={"book":"book_ID",
                        "librarian":"librarian_ID", 
                        "library_member":"user_ID", 
                        "author":"author_ID", 
                        "form":"form_ID",
                        "publisher":"publisher_ID",
                        "borrowed":"book_ID",
                        "borrowed":"user_ID",
                        "reserved":"book_ID",
                        "reserved":"user_ID"
                    }
            query_chosen="SELECT * FROM "+table_choice+" WHERE "+table_ID[table_choice]+"="+insert
            output_table(self, query_chosen, win)  
        elif(operation=="Custom/Conditional"):
            win=tk.Tk()
            custom=self.query_entry.get()
            query_chosen=custom
            output_table(self, query_chosen, win)            
        elif(operation=="Insert Row"):
            insert=self.values_entry.get()
            table_values={"book": " (book_ID, book_name, book_edition, genre, copies_available, isBorrowed, author_ID, publisher_ID, form_ID)",
                            "librarian": " (librarian_ID, First_Name, Last_Name, Address, Email, Gender)", 
                            "library_member": " (user_ID, First_Name, Last_Name, Address, Email, Gender, Birthdate, Age, librarian_ID)", 
                            "author": " (author_ID, First_Name, Last_Name, Gender)", 
                            "form": " (form_ID, form_name)",
                            "publisher": " (publisher_ID, publisher_name)",
                            "borrowed": " (book_ID, user_ID, date_borrowed, date_due)",
                            "reserved": " (book_ID, user_ID, reserve_date)"
                        }
            query_chosen="INSERT INTO " + table_choice + table_values[table_choice] + " VALUES " + insert
            update_database(query_chosen)
            tk.Button(self,text="Reset",command=self.reset).pack()
        elif(operation=="Update Row(s)"):
            header_choice=self.header_clicked.get()
            insert=self.values_entry.get()
            query_chosen="UPDATE "+table_choice+" SET "+header_choice+"="+insert
            update_database(query_chosen)   
            tk.Button(self,text="Reset",command=self.reset).pack() 
        elif(operation=="Delete Row(s)"):
            insert=self.values_entry.get()
            query_chosen="DELETE FROM "+table_choice +" "+insert
            update_database(query_chosen)
            tk.Button(self,text="Reset",command=self.reset).pack()
        elif(operation=="Delete Table"):
            table_choice = self.table_clicked.get() 
            query_chosen = "DELETE "+table_choice
            update_database(query_chosen)
            tk.Button(self,text="Reset",command=self.reset).pack()
        elif(operation=="Borrow a Book"):
            win = tk.Tk()
            tk.Label(self, text = "Which book would you like to borrow? Here are some available options", font=15).pack()
            query = "SELECT * FROM BOOK WHERE isBorrowed = 'No' and copies_available>0"
            
            tk.Label(self,text="Enter User ID:").pack()
            self.uID_entry=tk.Entry(self,width = 30)
            self.uID_entry.pack() 
            tk.Label(self,text="Enter Book ID of the book you want to borrow:").pack()
            self.bID_entry=tk.Entry(self,width = 30)
            self.bID_entry.pack() 
            tk.Button(self,text="Borrow",command=self.borrow_book).pack()
            output_table(self, query, win) 
        elif(operation=="Return a Book"):
            insert=self.uID_entry.get()
            win = tk.Tk()
            tk.Label(self, text = "Which book would you like to return? Here are the books you have borrowed", font=15).pack()
            query = "SELECT * FROM BORROWED WHERE USER_ID=" + insert
            
            tk.Label(self,text="Enter Book ID of the book you want to return:").pack()
            self.bID_entry=tk.Entry(self,width = 30)
            self.bID_entry.pack()
            tk.Button(self,text="Return",command=self.return_book).pack()
            output_table(self, query, win) 
        elif(operation=="Reserve a Book"):
            insert=self.uID_entry.get()
            win = tk.Tk()
            tk.Label(self, text = "Which book would you like to reserve? Here are some options", font=15).pack()
            query = "SELECT BOOK_ID FROM BOOK WHERE isBorrowed = 'Yes'"
            
            tk.Label(self,text="Enter Book ID of the book you want to reserve:").pack()
            self.bID_entry=tk.Entry(self,width = 30)
            self.bID_entry.pack() 
            tk.Button(self,text="Reserve",command=self.reserve_book).pack()
            output_table(self, query, win) 
        elif(operation=="Checked Out"):
            insert=self.uID_entry.get()
            win = tk.Tk()
            tk.Label(self, text = "These are the books you have checked out.", font=15).pack()
            query = "SELECT K.* FROM BOOK AS K, BORROWED AS D WHERE K.BOOK_ID = D.BOOK_ID and D.USER_ID = " + insert
            output_table(self, query, win) 
        elif(choice=="3rd Deliverable Queries"):
            win=tk.Tk()
            ten_query_options={"1st":"Select avg(Age) as average_age from library_member", 
                               "2nd":"Select count(Age) as Over_20 from library_member where Age > 20;", 
                               "3rd":"Select count(Gender) as number_of_men from library_member where Gender = 'M';", 
                               "4th":"Select form_name as most_form from form as t where t.form_ID = (select max(distinct(form_ID)) from book);", 
                               "5th":"Select book_name as Romance_Books from book where genre = 'Romance';", 
                               "6th":"Select count(Book_ID) as books_borrowed from borrowed where user_ID = 104275;", 
                               "7th":"Select book_name as book_written_by_author from book where author_ID = 3641;",
                               "8th":"Select count(isBorrowed) from book where isBorrowed = 'No'",
                               "9th":"Select sum(copies_available) from book",
                               "10th":"SELECT genre, (COUNT(genre)/(SELECT COUNT(*) FROM book)) * 100 AS PERCENTAGE FROM book GROUP BY genre ORDER BY PERCENTAGE DESC"
                            }
            output_table(self, ten_query_options[operation], win)  
        else:
            win=tk.Tk()
            header_choice=self.header_clicked.get()
            queries={"Show Column": "SELECT "+header_choice+" FROM "+table_choice, 
                    "Mean": "SELECT AVG("+header_choice+") AS MEAN FROM "+table_choice,
                    "Sum": "SELECT SUM("+header_choice+") FROM "+table_choice,
                    "Count": "SELECT COUNT("+header_choice+") FROM "+table_choice,
                    "Percentages": "SELECT "+header_choice+", (COUNT("+header_choice+")/(SELECT COUNT(*) FROM "+table_choice+")) * 100 AS PERCENTAGE FROM "+table_choice+" GROUP BY "+header_choice+" ORDER BY PERCENTAGE DESC"                      
                    }
            query_chosen=queries[operation]
            output_table(self, query_chosen, win)
        self.pack()

    def borrow_book(self):
        global insert, custom
        insert=self.uID_entry.get()
        custom=self.bID_entry.get()
        tk.Label(self, text = "Congratulations you have successfully borrowed this book! Make sure to return it in one week ('May 3rd')", font=10).pack()
        
        update_copy="UPDATE book SET copies_available=copies_available-1 where book.book_ID=" + custom
        update_database(update_copy)
        update_borrowed="UPDATE book SET isBorrowed = 'Yes' WHERE book_ID =" +custom+ " and copies_available=0"
        update_database(update_borrowed)
        insert_borrowed="INSERT into BORROWED (book_ID, user_ID, date_borrowed, date_due) VALUES (" +custom+","+insert+",'Apr 26 2023', 'May 3 2023')"
        update_database(insert_borrowed)

    def return_book(self):
        global custom
        custom=self.bID_entry.get()
        tk.Label(self, text = "You have successfully returned this book!", font=10).pack()
        
        update_copy="UPDATE book SET copies_available=copies_available+1 where book.book_ID=" + custom
        update_database(update_copy)
        update_borrowed="UPDATE book SET isBorrowed = 'No' WHERE book_ID =" + custom
        update_database(update_borrowed)
        delete_borrowed="DELETE FROM BORROWED WHERE BOOK_ID=" + custom
        update_database(delete_borrowed)

    def reserve_book(self):
        global custom
        custom=self.bID_entry.get()
        tk.Label(self, text = "You have successfully reserved this book!", font=10).pack()
        
        insert_reserve="INSERT INTO RESERVED (book_ID, user_ID, reserve_date) VALUES ("+custom+","+insert+",'26-Apr')"
        update_database(insert_reserve)

    def reset(self):
        for widget in self.winfo_children(): 
            widget.destroy()
        self.destroy()
        QueryInterface(self.master)
    
    def headers(self, table):
        my_connect = initialize_connection(user, password)
        my_conn =  my_connect.cursor()
        my_conn.execute("Select * from " + table)
        sequence = my_conn.column_names
        return sequence
 
class MainWindow(tk.Frame):
    def __init__(self, master):
        super().__init__()
        self.master = master
        center_window(600, 400)
        self.pack()
 
root = tk.Tk()
root.eval('tk::PlaceWindow . center')
WelcomeWindow(root)
root.mainloop()
 