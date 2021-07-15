Shader "Custom/CTT"
{
	Properties
	{ 
		_MainTex("Texture", 2D) = "white" {}
		_RePlaseTexture1("Texture1", 2D) = "white" {}
		_RePlaseTexture2("Texture2", 2D) = "white" {}
		_RePlaseTexture3("Texture3", 2D) = "white" {}
		_Color1("Color1", Color) = (1, 1, 1, 1)
		_Color2("Color2", Color) = (1, 1, 1, 1)
		_Color3("Color3", Color) = (1, 1, 1, 1)
	}

		SubShader
		{
			Pass
			{
				CGPROGRAM
				#pragma vertex vert_img
				#pragma fragment frag
				#include "UnityCG.cginc"

				// Properties
				sampler2D _MainTex;
				sampler2D _RePlaseTexture1;
				sampler2D _RePlaseTexture2;
				sampler2D _RePlaseTexture3;
				float4 _Color1;
				float4 _Color2;
				float4 _Color3;

				float4 frag(v2f_img input) : COLOR
				{
					float4 base = tex2D(_MainTex, input.uv);
					float4 base1 = tex2D(_RePlaseTexture1, input.uv);
					float4 base2 = tex2D(_RePlaseTexture2, input.uv);
					float4 base3 = tex2D(_RePlaseTexture3, input.uv);

					if (base.r == _Color1.r && base.g == _Color1.g && base.b == _Color1.b)
						base = base1;
					else if (base.r == _Color2.r && base.g == _Color2.g && base.b == _Color2.b)
						base =base2;
					else if (base.r == _Color3.r && base.g == _Color3.g && base.b == _Color3.b)
						base = base3;

					return base;
				}
				ENDCG
			}
		}
}
