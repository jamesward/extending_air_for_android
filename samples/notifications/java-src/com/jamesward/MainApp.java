package com.jamesward;

import air.app.AppEntry;
import android.content.Intent;
import android.os.Bundle;

public class MainApp extends AppEntry {

	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		try
		{
			Intent srv = new Intent(this, TestService.class);
			startService(srv);
		}
		catch (Exception e)
		{
			// service could not be started
		}
		
		super.onCreate(savedInstanceState);
	}

}