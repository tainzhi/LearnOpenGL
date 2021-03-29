#version 330 core
out vec4 FragColor;

// texture samplers
uniform vec3 objectColor;
uniform vec3 lightColor;
uniform vec3 lightPos; 

in vec3 Normal;
in vec3 FragPos;

void main()
{
	float ambientStrength = 0.1;
	vec3 ambient = ambientStrength * lightColor;

	// diffuse
	vec3 norm = normalize(Normal);
	vec3 lightDir = normalize(lightPos - FragPos);
	float diff = max(dot(norm, lightDir), 0.0);
	vec3 diffuse = diff * lightColor;

	// linearly interpolate between both textures (80% container, 20% awesomeface)
	FragColor = vec4((ambient + diffuse)* objectColor, 1.0f);
}