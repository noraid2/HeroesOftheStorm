/*
OOP의 특징

1.상속
2.캡슐화 >> private
3.다형성

1.상속의 표현
java : child extends Base
C# : child : Base

2.상속의 특징
2.1 다중 상속은 불가능
2.2 단일 상속(계층적 상속 지원 : 통해서 여러 개의 클래스를 상속...)
2.3 다중 상속을 지원(유일한 자원 : Interface)

3.상속의 의미
3.1 재사용성
3.2 단점 : 초기 비용(설계)

재사용성 >> 설계 >> 비용(시간, 공통자원 등)

상속관계에서 메모리?
	Grandfather>father>child
	사용자가 만드는 모든 클래스는 default object 클래스 상속
	class Car{}>>내부적으로
	
	
	Object 모든 클래스 root(최상위) : 모든 클래스의 부모 클래스

 */
class Grandfather{
public int gmoney = 5000;
private int pmoney = 10000;//private 상속관계 어떤의미 : 접근 불가 : 내부에서 활용

}

class father{
public int fmoney = 1000;
}


class son extends father{
	public int cmoney = 500;
	son ch = new son();
}



public class Ex01_Inherit {

	public static void main(String[] args) {
		

	}

}
