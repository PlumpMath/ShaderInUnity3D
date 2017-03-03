Shader "ShaderInUnity3D/Toon Shading" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_RampTex ("Ramp", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma surface surf Toon

		sampler2D _MainTex;
		sampler2D _RampTex;

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}

		fixed4 LightingToon(SurfaceOutput s, fixed3 lightDir, fixed atten) {
			half NdotL = dot(s.Normal, lightDir);
			NdotL = tex2D(_RampTex, fixed2(NdotL, 0.5));

			fixed4 c;
			c.rgb = s.Albedo * _LightColor0.rgb * NdotL * atten;
			c.a = s.Alpha;

			return c;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
