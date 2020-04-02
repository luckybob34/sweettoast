#pragma once

#include "Core.h"
#include "spdlog\spdlog.h"
#include "spdlog\fmt\ostr.h"

namespace toast {
	class TOAST_API Log
	{

		public:
			static void Init();

			inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
			inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

		private:
			static std::shared_ptr<spdlog::logger> s_CoreLogger;
			static std::shared_ptr<spdlog::logger> s_ClientLogger;

	};
}

//Core Log Macros
#define TOAST_CORE_TRACE(...)	::toast::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define TOAST_CORE_INFO(...)	::toast::Log::GetCoreLogger()->info(__VA_ARGS__)
#define TOAST_CORE_WARN(...)	::toast::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define TOAST_CORE_ERROR(...)	::toast::Log::GetCoreLogger()->error(__VA_ARGS__)
#define TOAST_CORE_FATAL(...)	::toast::Log::GetCoreLogger()->fatal(__VA_ARGS__)


//Client Log Macros
#define TOAST_TRACE(...)		::toast::Log::GetClientLogger()->trace(__VA_ARGS__)
#define TOAST_INFO(...)			::toast::Log::GetClientLogger()->info(__VA_ARGS__)
#define TOAST_WARN(...)			::toast::Log::GetClientLogger()->warn(__VA_ARGS__)
#define TOAST_ERROR(...)		::toast::Log::GetClientLogger()->error(__VA_ARGS__)
#define TOAST_FATAL(...)		::toast::Log::GetClientLogger()->fatal(__VA_ARGS__)