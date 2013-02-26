import java.io.File;

public class ls {
	public static void main(String[] args) {
		if (args.length == 0) {
			listFiles(".");
		} else {
			for (int i = 0; i<args.length; i++) {
				String dir = args[i];
				System.out.println("[" + dir + "]");
				listFiles(dir);
				if (i < (args.length-1))
					System.out.println();
			}
		}
	}

	public static void listFiles(final String dir) {
		try {
			File f = new File(dir);
			for (final File entry : f.listFiles()) {
				System.out.println(entry.getName());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
