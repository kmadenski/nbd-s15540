//1a
def task1_a() = {
    var days = List("Poniedziałek","Wtorek","Sroda","Czwartek","Piątek","Sobota","Niedziela")
    var result = "";
    for (i <- 0 until days.length){
    result = result + days(i)
    if(i < days.length - 1){
        result = result + ","
    }
    }
    println(result)
}


//1b
def task1_b() = {
    var days = List("Poniedziałek","Wtorek","Sroda","Czwartek","Piątek","Sobota","Niedziela")
    var result = "";
    for (i <- 0 until days.length if days(i) contains "P"){
    if(result != ""){
        result = result + ","
    }
    result = result + days(i)
    }
    println(result)
}

//1c
def task1_c() = {
    var days = List("Poniedziałek","Wtorek","Sroda","Czwartek","Piątek","Sobota","Niedziela")
    var result = "";
    var i = 0
    while (i < days.length){
    if(result != ""){
        result = result + ","
    }
    result = result + days(i)
      i+=1
    }
    println(result)
}

//https://stackoverflow.com/questions/12496959/summing-values-in-a-list
var days = List("Poniedziałek","Wtorek","Sroda","Czwartek","Piątek","Sobota","Niedziela")

def task2a(days: List[String]): String = {
  days match{
    case x :: tail => x + (if (tail.length > 0) "," else "") + task2a(tail)
    case Nil => ""
  }
}

println(task2a(days))

var days = List("Poniedziałek","Wtorek","Sroda","Czwartek","Piątek","Sobota","Niedziela")

def task2b(days: List[String]): String = {
  days match{
    case x :: tail => task2b(tail) + (if (tail.length > 0) "," else "") + x
    case Nil => ""
  }
}

println(task2b(days))

//3 - 2a jest ok w kontekście ogonowej

//4
var days = List("Poniedziałek","Wtorek","Sroda","Czwartek","Piątek","Sobota","Niedziela")

def task4a(days: List[String]): String = {
  return days.foldLeft("")((lastResult,current) => lastResult + (if (lastResult != "") "," else "") +current)
}

println(task4a(days))

var days = List("Poniedziałek","Wtorek","Sroda","Czwartek","Piątek","Sobota","Niedziela")

def task4b(days: List[String]): String = {
  return days.foldRight("")((lastResult,current) => lastResult + (if (current != "") "," else "") + current )
}

println(task4b(days))


//5
def task5() = {
  var products = Map("Stół" -> 100, "Krzesło" -> 50, "Taboret" -> 25)

  var discount: Int => Double = value => value * 0.9
  var mapped = products.view.mapValues(discount)
  println(mapped.view.force)
}


//6
def task6() = {
  def tupleFun(in: (Int, String, Double)) : Unit = {
    in.productIterator.foreach(println)
  }
  var tuple = (1,"string",2.5)
  tupleFun(tuple)
}



def task7() = {
      val capitals = Map("France" -> "Paris", "Japan" -> "Tokyo")
      
      println("capitals.get( \"France\" ) : " +  capitals.get( "France" ))
      println("capitals.get( \"India\" ) : " +  capitals.get( "India" ))
}



def task9(): List[Int] = {
  var numbers = List(5,6,7,8)

  var increment: Int => Int = value => value + 1
  var mapped = numbers.map(increment)
  return mapped;
}
def task10(): List[Int] = {
  var numbers = List(-8,-5,6,12,15)
  var absolute: Int => Int = value => (value).abs
  var mapped = numbers.filter(_ >= -5).filter(_ <= 12).map(absolute)
  return mapped;
}

println(task10())
