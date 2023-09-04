import mysql.connector
from tkinter import*
from tkinter import ttk

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="almacen"
)
cursor = conn.cursor()

def cargar_productos():
    tree.delete(*tree.get_children())
    cursor = conexion.cursor()
    cursor.execute("")
    for row in cursor.fetchall():
        tree.insert("", "end", values=row)

ventana = Tk()
ventana.title("Gestión de Almacén")
        
label_titulo = Label(ventana, text="Almacen", font=("", 13), height=2, width=30, borderwidth=1,  relief = "raised", fg="black", bg= "white")
label_titulo.pack(padx=10, pady=10)
ventana.title("Almacen")
ventana.resizable(0,0)
ventana.config(bg= "OliveDrab1")

tree = ttk.Treeview(ventana, columns=("Producto", "Categoria", "Marca", "Precio", "Stock"))
tree.heading("#1", text="Producto") 
tree.heading("#2", text="Categoria")
tree.heading("#3", text="Marca")  
tree.heading("#4", text="Precio")
tree.heading("#5", text="Stok")
tree.column("#0", width=0, stretch=NO) 
tree.pack(padx=10, pady=10)

cargar_button = Button(ventana, text="Cargar Datos", font= ("",9,'bold'), height=2, width=15, borderwidth=4,  relief = "raised", activebackground="green2",bg ='snow', command=cargar_datos)
cargar_button.pack(padx=10,pady=10)


ventana.mainloop()

conexion.close()
