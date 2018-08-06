##Normal Map
normal map的每一个像素值是一个处于切空间（tangent space）的法线向量。在计算光照时

1. 将顶点的法线（normal），切线（tangent）和次法线（binormal）根据法线矩阵从模型空间转到视图空间
2. 根据转换后的normal，tangent和binormal构造（从切空间->模型空间->世界空间->视图空间的）矩阵
3. 在逐像素计算步骤中，根据uv取出normal map中的法线值，并转换到视图空间
4. 使用该法线向量替代顶点法线进行光照计算

normal map实现的难点主要在于tangent和binormal的计算，通常建模软件会负责此任务。
##AO Map
##Light Map
##Shadow Map
##Specular Map
##Env Map
##Displacement Map
##Emissive Map
##Metalness Map
##Roughmess Map