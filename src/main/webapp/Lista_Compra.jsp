<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrito de compra utilizando sesiones</title>
</head>
<body>

<form name="Formulario_Compra" action="Lista_Compra.jsp">
 
  <p>Artículos a comprar:</p>
  <p>
    <label>
      <input type="checkbox" name="articulos" value="agua " >
      Agua </label>
    <br>
    <label>
      <input type="checkbox" name="articulos" value="leche" >
      Leche </label>
    <br>
     <label>
      <input type="checkbox" name="articulos" value="pan" >
      Pan </label>
    <br>
     <label>
      <input type="checkbox" name="articulos" value="mazanas" >
      Manzanas </label>
    <br>
     <label>
      <input type="checkbox" name="articulos" value="carne" >
      Carne </label>
      <br>
       <label>
      <input type="checkbox" name="articulos" value="pescado" >
      Pescado </label>
  </p>
  <p>
    <input type="submit" name="button" id="button" value="Enviar">
    <br>
  </p>
</form>

<h2>Carro de la compra: </h2>

<ul>

<%@ page import = "java.util.*" %>

<%

List<String> ListaElementos = (List<String>) session.getAttribute("misElementos"); //hacemos un casting ya que el metodo getAttribute devuelve un Object y el array almacena Strings, guardara los elementos que hayan sido seleccionados en el carrito de compra

if (ListaElementos == null){ //Creamos un arreglo dinamico que almacenara los productos seleccionados
	
	ListaElementos = new ArrayList<String>(); //Inicializamos el arrayList, en el caso de que este vacio
	
	session.setAttribute("misElementos", ListaElementos);//Arguntos el cual el primero es el nombre de buestra sesion y el segubdo es el objeto de tipo Object, que en este caso seria el arrayList
	
}

String [] elementos = request.getParameterValues("articulos");// Metodo que se detona a partir de que pulsan en boton enviar, al pulsar el boton enviar la pag se recarga por completo, por lo que vuelve a cargar el formulario

if (elementos != null) {
	
	for (String elemTem: elementos) {//Rellenamos el arrayList con los leccionados
		
	//	out.println("<li>" + elemTem + "</li>");
	
	ListaElementos.add(elemTem);//Agrega los elementos del array "elementos" y los agrega al arrayList<ListaElementos>
		
	}
	
	for (String i: ListaElementos){ //Recorremos el array para que imprima los resultados
		
		out.println("<li>" + i + "</li>");
	}
}

%>

</ul>




</body>
</html>