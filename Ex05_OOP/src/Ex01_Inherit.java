/*
OOP�� Ư¡

1.���
2.ĸ��ȭ >> private
3.������

1.����� ǥ��
java : child extends Base
C# : child : Base

2.����� Ư¡
2.1 ���� ����� �Ұ���
2.2 ���� ���(������ ��� ���� : ���ؼ� ���� ���� Ŭ������ ���...)
2.3 ���� ����� ����(������ �ڿ� : Interface)

3.����� �ǹ�
3.1 ���뼺
3.2 ���� : �ʱ� ���(����)

���뼺 >> ���� >> ���(�ð�, �����ڿ� ��)

��Ӱ��迡�� �޸�?
	Grandfather>father>child
	����ڰ� ����� ��� Ŭ������ default object Ŭ���� ���
	class Car{}>>����������
	
	
	Object ��� Ŭ���� root(�ֻ���) : ��� Ŭ������ �θ� Ŭ����

 */
class Grandfather{
public int gmoney = 5000;
private int pmoney = 10000;//private ��Ӱ��� ��ǹ� : ���� �Ұ� : ���ο��� Ȱ��

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
