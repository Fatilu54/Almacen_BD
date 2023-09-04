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

ventana = Tk()
ventana.title("Gestión de Almacén")


def agregar_producto():
    productos_tree.delete(*productos_tree.get_children())
    cursor.execute('''''')
    resultados = cursor.fetchall()
    for row in resultados:
        productos_tree.insert("", "end", values=row)


productos_tree = ttk.Treeview(ventana, columns=("Producto", "Categoría", "Marca", "Precio", "Stock"), show="headings")
productos_tree.heading("Producto", text="Producto")
productos_tree.heading("Categoría", text="Categoría")
productos_tree.heading("Marca", text="Marca")
productos_tree.heading("Precio", text="Precio")
productos_tree.heading("Stock", text="Stock")
productos_tree.pack()


ventana.mainloop()
conn.close()
