#pragma once

#include "Core.h"

namespace toast {

	class TOAST_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

	};

	//To be deifined in client
	Application* CreateApplication();
}