/*
설계도 1개....업무가 복잡하지 않으면..
업무가 복잡해지면...1개 이상의 설계도를\ 제작
고민>쇼핑몰 > 회원관리, 주문관리, 배송관리 등등.... 설계도 5장...
**기준점**  여러개의 설계도를 (관계) 맺어주는 것

1. 상속관계(is ~ a : 상속) ~ 은 ~ 이다

2. 포함관계(has ~ a : 포함)~ 은 ~ 을(를)가지고 있다


예)
원 클래스
도형 클래스
>> 원 extends 도형(상속관계)
원 클래스
점 클래스
>> has ~ a(member field)
>>class 원{점 변수명}


경찰 클래스

총 클래스
예) 원 삼각형 사각형

원은 도형이다
삼각형은 도형이다
사각형으 도형이다

도형 : 추상화, 일반화(그리다, 색상) >> 공통자원


원 : 구체화, 특수화(반지름, 점) >> 본인만이 가진 특징
class Shape : 일반화, 추상, 공통(그리다, 색상) >> 상속
class Point : 점						   >> 공통






 */
//추상화, 일반화, 공통
class Shape{
	String color = "gold";
	void draw() {
		System.out.println("그리다");
	}
}
//공통
class Point{
	int x;
	int y;
	Point(){
		this(10,15);
	}
	Point(int x, int y){
		this.x = x;
		this.y = y;
	}
}
class Circle extends Shape{
	Point point;
	
	int r;
	Circle(){
		//this.r = 10;
		//this.point = new Point(10,15);
		this(10,new Point(10,15));
	}
	Circle(int r, Point point){
		this.r = r;
		this.point = point;
	}
	
}

//Circle circle = new Circle();
//Circle circle = new Circle(15, new Point(3,5))





public class Ex02_Inherit_Composition {

	public static void main(String[] args) {
		Circle circle = new Circle();
		System.out.println("반지름 : "+circle.r);
		System.out.println("부모 : "+circle.color);
		System.out.println("좌표 : "+circle.point.x);
		System.out.println("좌표 : "+circle.point.y);
		circle.draw();
		
		Circle circle2 = new Circle(20, new Point(2,5));
		System.out.println("반지름 : "+circle2.r);
		System.out.println("부모 : "+circle2.color);
		System.out.println("좌표 : "+circle2.point.x);
		System.out.println("좌표 : "+circle2.point.y);
		circle2.draw();
	}

}
