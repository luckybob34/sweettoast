#pragma once

#ifdef TOAST_PLATFORM_WINDOWS
	
	extern toast::Application* toast::CreateApplication();
	
	int  main(int argc, char** argv)
	{
		auto app = toast::CreateApplication();
		app->Run();
		delete app;
	}
#endif