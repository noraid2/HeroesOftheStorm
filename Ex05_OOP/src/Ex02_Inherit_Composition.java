/*
���赵 1��....������ �������� ������..
������ ����������...1�� �̻��� ���赵��\ ����
���>���θ� > ȸ������, �ֹ�����, ��۰��� ���.... ���赵 5��...
**������**  �������� ���赵�� (����) �ξ��ִ� ��

1. ��Ӱ���(is ~ a : ���) ~ �� ~ �̴�

2. ���԰���(has ~ a : ����)~ �� ~ ��(��)������ �ִ�


��)
�� Ŭ����
���� Ŭ����
>> �� extends ����(��Ӱ���)
�� Ŭ����
�� Ŭ����
>> has ~ a(member field)
>>class ��{�� ������}


���� Ŭ����

�� Ŭ����
��) �� �ﰢ�� �簢��

���� �����̴�
�ﰢ���� �����̴�
�簢���� �����̴�

���� : �߻�ȭ, �Ϲ�ȭ(�׸���, ����) >> �����ڿ�


�� : ��üȭ, Ư��ȭ(������, ��) >> ���θ��� ���� Ư¡
class Shape : �Ϲ�ȭ, �߻�, ����(�׸���, ����) >> ���
class Point : ��						   >> ����






 */
//�߻�ȭ, �Ϲ�ȭ, ����
class Shape{
	String color = "gold";
	void draw() {
		System.out.println("�׸���");
	}
}
//����
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
		System.out.println("������ : "+circle.r);
		System.out.println("�θ� : "+circle.color);
		System.out.println("��ǥ : "+circle.point.x);
		System.out.println("��ǥ : "+circle.point.y);
		circle.draw();
		
		Circle circle2 = new Circle(20, new Point(2,5));
		System.out.println("������ : "+circle2.r);
		System.out.println("�θ� : "+circle2.color);
		System.out.println("��ǥ : "+circle2.point.x);
		System.out.println("��ǥ : "+circle2.point.y);
		circle2.draw();
	}

}
