#include <toast.h>

class Sandbox : public toast::Application
{
public:
	Sandbox()
	{

	}
	~Sandbox()
	{

	}
};

toast::Application* toast::CreateApplication()
{
	return new Sandbox();
}