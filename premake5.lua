workspace "toast"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "toast/vendor/GLFW/include"

include "toast/vendor/GLFW"

project "toast"
	location "toast"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "toastpch.h"
	pchsource "toast/src/toastpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{	
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links 
	{ 
		"GLFW",
		"opengl32.lib"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"TOAST_PLATFORM_WINDOWS",
			"TOAST_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "TOAST_DEBUG"
		symbols "on"

	filter "configurations:Release"
		defines "TOAST_RELEASE"
		optimize "on"

	filter "configurations:Dist"
		defines "TOAST_DIST"
		optimize "on"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"toast/vendor/spdlog/include",
		"toast/src"
	}

	links
	{
		"toast"
	}

	filter "system:windows"
		systemversion "latest"
		
		defines
		{
			"TOAST_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "TOAST_DEBUG"
		symbols "on"

	filter "configurations:Release"
		defines "TOAST_RELEASE"
		optimize "on"

	filter "configurations:Dist"
		defines "TOAST_DIST"
		optimize "on"