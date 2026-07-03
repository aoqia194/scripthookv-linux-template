#include <Windows.h>

#include <ScriptHookV/main.h>
#include <ScriptHookV/natives.h>

#define RECT_SIZE 0.25f

void update()
{
    GRAPHICS::DRAW_RECT(0.5f - RECT_SIZE, 0.5f - RECT_SIZE, RECT_SIZE, RECT_SIZE, 255, 0, 255, 255);
}

void init()
{
    while (true)
    {
        update();
        WAIT(0);
    }
}

BOOL APIENTRY DllMain(const HMODULE handle, const DWORD reason, LPVOID reserved)
{
    switch (reason)
    {
    case DLL_PROCESS_ATTACH:
        scriptRegister(handle, init);
        break;
    case DLL_PROCESS_DETACH:
        scriptUnregister(handle);
        break;
    default:
        break;
    }

    return TRUE;
}
