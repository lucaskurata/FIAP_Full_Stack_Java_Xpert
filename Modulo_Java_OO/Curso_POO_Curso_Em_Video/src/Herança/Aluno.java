package Heran�a;

public class Aluno extends Pessoa{

	private int matricula;
	private String curso;
	
	public int getMatricula() {
		return matricula;
	}
	public void setMatricula(int matricula) {
		this.matricula = matricula;
	}
	public String getCurso() {
		return curso;
	}
	public void setCurso(String curso) {
		this.curso = curso;
	}
	
	public void cancelarMatricula() {
		System.out.println("Matr�cula cancelada com sucesso.");
	}
	
}
