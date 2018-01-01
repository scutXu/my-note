#Canvas
###RenderMode
- Screen Space - Overlay：最常用的模式，UI直接覆盖在屏幕上，不会被其他内容遮挡

- Screen Space - Camera：UI摆放在camera前方一个平面上，取决于平面和相机的距离，可能被场景中的其他物体遮挡

- World Space：UI作为3D物体摆放在场景中

#Canvas Scaler(Script)
###UI Scale Mode
- Constant Pixel Size：Canvas分辨率固定，不受屏幕分辨率影响。UI的大小取决于UI素材的分辨率
- Scale With Screen Size：最常用的模式。根据屏幕分辨率自适应缩放
- Constant Physical Size：

###Reference Resolution
制作UI时所基于的分辨率
###Screen Match Mode
- Match Width Or Height
- Expand
- Shrink

#Graphic Raycaster(Script)