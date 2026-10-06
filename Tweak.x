#import <UIKit/UIKit.h>
#import <substrate.h>

/*
 * VanHuy.dylib - Mod Sky Bầu Trời Tím (Galaxy/Purple Sky)
 * Author: Van Huy
 */

struct Color {
    float r, g, b, a;
};

// Hook RenderSettings Skybox trong Unity Engine
void (*orig_RenderSettings_set_skybox)(void* material);
void new_RenderSettings_set_skybox(void* material) {
    orig_RenderSettings_set_skybox(material);
}

%ctor {
    NSLog(@"[VanHuy.dylib] Sky Mod Van Huy Loaded!");
}
