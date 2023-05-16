package p1;

public class EncDec 
{
    // static int counter;
    static int key = 2;
    // static char chmat[][], ch;

    public static String RFencrypt(String input) throws Exception
    {
        return input;
//        String evenchars = "", oddchars = "", encrypted = "";
//
//        for (int i = 0; i < input.length(); i += key)
//        {
//            evenchars += String.valueOf(input.charAt(i));
//        }
//        for (int i = 1; i < input.length(); i += key)
//        {
//            oddchars += String.valueOf(input.charAt(i));
//        }
//        encrypted = evenchars + oddchars;
//        return encrypted;
    }

    public static String RFdecrypt(String input) throws Exception
    {
        return input;
//        String evenchars = "", oddchars = "", decrypted = "";
//
//        int j = 0, k = 0;
//        for (int i = 0; i < input.length(); i++) 
//        {
//            if (i % key == 0) 
//            {
//                decrypted += String.valueOf(evenchars.charAt(j++));
//            }
//            if (i % key != 0)
//            {
//                decrypted += String.valueOf(oddchars.charAt(k++));
//            }
//        }
//
//        return decrypted;
    }

    public static String SCencrypt(String input) throws Exception
    {
        return input;
//        String encrypted = "";
//
//        char chmat[][], ch;
//
//        if (key >= input.length() || key == 1)
//        {
//            return input;
//        }
//        
//        int rows = (int)(Math.ceil(input.length() / (float)key));
//        chmat = new char[(int)rows][key];
//        int k = 0;
//        abc:
//        for (int i = 0; i < rows; i++)
//        {
//            for (int j = 0; j < key; j++)
//            {
//                if (k >= input.length())
//                {
//                    break abc;
//                }
//                else
//                {
//                    chmat[i][j] = input.charAt(k);
//                }
//                k++;
//            }
//        }
//        for (int i = 0; i < key; i++)
//        {
//            for(int j = 0; j < rows; j++)
//            {
//                ch = chmat[j][i];
//                if (ch == '_')
//                {
//                    encrypted += '_';
//                }
//                else
//                {
//                    encrypted += ch;
//                }
//            }
//        }
//
//        return encrypted;
    }

    public static String SCdecrypt(String input) throws Exception
    {
        return input;
//        String decrypted = "";
//
//        char chmat[][], ch;
//
//        int rows = key;
//        int cols = (int)(Math.ceil(input.length() / (float)rows));
//        chmat = new char[rows][cols];
//        int k = 0;
//
//        abc:
//        for (int i = 0; i < rows; i++)
//        {
//            for (int j = 0; j < cols; j++)
//            {
//                if (k >= input.length())
//                {
//                    break abc;
//                }
//                else
//                {
//                    chmat[i][j] = input.charAt(k);
//                }
//                k++;
//            }
//        }
//        for (int i = 0; i < cols; i++)
//        {
//            for (int j = 0; j < rows; j++)
//            {
//                ch = chmat[j][i];
//                if (ch == '_')
//                {
//                    decrypted += '_';
//                }
//                else
//                {
//                    decrypted += ch;
//                }
//            }
//        }
//
//        return decrypted;
    }
}
