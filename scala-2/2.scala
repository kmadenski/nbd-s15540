//1
def task1(weekDay: String): String = {
  weekDay match {
    case "Poniedziałek" => "Praca"
    case "Wtorek"       => "Praca"
    case "Sroda"        => "Praca"
    case "Czwartek"     => "Praca"
    case "Piątek"       => "Praca"
    case "Sobota"       => "Weekend"
    case "Niedziela"    => "Weekend"
    case _ => "Nie ma takiego dnia"
  }
}

println(task1("Poniedziałek"))
println(task1("Niedziela"))
println(task1("Dzień Dobry"))

//2
class Konto(val stanKonta: Int){
  def this() = {
    this(0)
  }
  def wplata(kwota: Int): Unit = {
  }
  def wyplata(kwota: Int): Unit = {
  }
}

//3
class Osoba(var imie: String, var nazwisko: String )

val o1 = new Osoba("Tomasz", "Pieciukiewicz")
val o2 = new Osoba("Arnold", "Gąska")
val o3 = new Osoba("Bogumił", "Bogusławski")

def przywitanie(osoba: Osoba): String = {
  osoba.imie match {
    case "Tomasz" => "Kiedy drugi termin profesorze " + osoba.nazwisko
    case "Arnold"       => "Hasta la vista, " + osoba.imie
    case _ => "Witaj " + osoba.imie
  }
}

println(przywitanie(o1))
println(przywitanie(o2))
println(przywitanie(o3))

//4
def example(number: Int, fx: Int => Int): Int = {
    return fx(fx(fx(number)))
}

def fun(number: Int): Int = {
  return number * 2
}
println(example(5, fun))



//5
class Osoba(val imie: String, val nazwisko: String, val podatek: Double)

trait Student extends Osoba{
  override val podatek = 0
}
trait Nauczyciel extends Pracownik{
  override val podatek = 0.1 * pensja
}
trait Pracownik extends Osoba{
  var pensja: Int
  override val podatek = 0.2 * pensja
}

var o1 = new Osoba("Adam", "Kowalski", 10) with Student
println(o1.podatek)
//@todo jak ogarnąć tego pracownika ? - kwestia pensji
//var o2 = new Osoba("Karol", "Timon", 40) with Pracownik
//println(o2.podatek)

// var o3 = new Osoba("Borys", "Thomas", 20) with Nauczyciel
// println(o3.podatek)