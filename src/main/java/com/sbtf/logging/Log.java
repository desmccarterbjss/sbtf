package com.sbtf.logging;

import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Log {
	
	public static void errorMessage(String message)
	{
		outputStderr("ERROR",message);
	}
	
	public static void infoMessage(String message)
	{
		outputStdout("INFO",message);
	}
	
	public static void debugMessage(String message)
	{
		outputStdout("DEBUG",message);
	}
	
	public static void warnMessage(String message)
	{
		outputStdout("WARN",message);
	}
	
	public static void testMessagePass(String message)
	{
		outputStdout("TEST-PASSED",message);
	}
	
	public static void tearDownMessage(String message)
	{
		outputStdout("TEAR-DOWN-TEST",message);
	}
	
	public static void testMessageFail(String message)
	{
		outputStderr("TEST-FAILED",message);
	}
	
	protected static void outputStdout(String prefix, String text)
	{
		outputToStream(prefix,text,System.out);
	}
	
	protected static void outputStderr(String prefix, String text)
	{
		outputToStream(prefix,text,System.err);
	}
	
	protected static void outputToStream(String prefix, String text,
			PrintStream stream)
	{
		stream.printf("[%-15s %-20s] %s\n", 
				prefix, 
				new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new Date()),
				text);
		stream.flush();		
	}	
}
