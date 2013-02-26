/*
 * $ javac echo.java && java echo hello world
 */
public class echo {
	public static void main(String[] args) {
		StringBuilder output = new StringBuilder();
		for (int i = 0; i<args.length; i++) {
			output.append(args[i]);
			if (i < (args.length-1))
				output.append(" ");
		}
		System.out.println(output.toString());
	}
}
