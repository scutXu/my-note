###Lambert
```
vec3 lambert(float Ka, vec3 ambient,
			 float Kd, vec3 diffuse, vec3 lightDirection, vec3 vertexNormal)
{
	return (Ka * ambient) + 
		   (Kd * diffuse * max(dot(- lightDirection, vertexNormal), 0.0));
}

```
###Phong
```
vec3 phong(float Ks, vec3 specular, vec3 lightDirection, vec3 viewDirection, vec3 vertexNormal, float shininess)
{
	vec3 reflectedLightDirection = reflect(lightDirection, vertexNormal);
	return Ks * specular * pow(max(dot(- reflectedLightDirection, viewDirection), 0.0), shininess);
}
```
###Blinn-Phong
```
vec3 blinnPhong(float Ks, vec3 specular, vec3 lightDirection, vec3 viewDirection, vec3 vertexNormal, float shininess)
{
	vec3 halfDirection = normalize(lightDirection + viewDirection);
	return Ks * specular * pow(max(dot(- halfDirection, vertexNormal), 0.0), shininess);
}
```
###Physical

#Map
###BumpMap 凹凸贴图
```
uniform mat4 uvTransform;
varying vec2 vUv;

```
###NormalMap 法线贴图
###SpcularMap
###AlphaMap
###EmissiveMap
###RoughenessMap
###MetalnessMap
###LightMap
```
attribute vec2 uv2;
varying vec2 vUv2;
```
###AoMap
```
attribute vec2 uv2;
varying vec2 vUv2;
```
