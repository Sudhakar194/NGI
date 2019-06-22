import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;


public class Java_Httpdownload {

	public static void main(String[] args) {
		downloadFileFromURL();
	}
	public static void downloadFileFromURL() {  
		String urlString = "https://www.youtube.com/watch?v=5fkxy85A-WA";
		
        try {
            URL website = new URL(urlString);
            ReadableByteChannel rbc;
            rbc = Channels.newChannel(website.openStream());
            FileOutputStream fos = new FileOutputStream(new File("D:/Sudhakar/Docs"));
            fos.getChannel().transferFrom(rbc, 0, Long.MAX_VALUE);
            fos.close();
            rbc.close();
            
            
            
            
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
