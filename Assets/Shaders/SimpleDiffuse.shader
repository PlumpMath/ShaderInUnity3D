Shader "ShaderInUnity3D/Simple Diffuse" {
	Properties {
		_MainTex ("Texture", 2D) = "White" {}
	}

	SubShader {
		Tags { "RenderType"="Opaque" }
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input {
			float2 uv_MainTex;
		};

		sampler2D _MainTex;

		void surf (Input IN, inout SurfaceOutput o) {
			// o.Albedo = 1; // 1 = (1, 1, 1, 1) = White
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
