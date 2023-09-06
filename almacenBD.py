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
    consultar = ("SELECT categoria.nombre, marca.nombre, producto.nombre FROM producto INNER JOIN categoria ON producto.id_categoria = categoria.id_categoria INNER JOIN marca ON producto.id_marca = marca.id_marca")
    cursor.execute(consultar)
    for row in cursor.fetchall():
        tree.insert("", "end", values=row)

ventana = Tk()
ventana.title("Gestión de Almacén")

tree = ttk.Treeview(ventana, columns=("categoria", "marca","producto" )
tree.heading("#1", text="Categoria")
tree.heading("#2", text="Marca")  
tree.heading("#3", text="Producto") 
tree.column("#0", width=0, stretch=NO) 
tree.pack(padx=10, pady=10)

cargar_button = Button(ventana, text="Cargar Datos", font= ("",9,'bold'), height=2, width=15, borderwidth=4,  relief = "raised", activebackground="green2",bg ='snow', command=cargar_productos)
cargar_button.pack(padx=10,pady=10)


ventana.mainloop()

conexion.close()
