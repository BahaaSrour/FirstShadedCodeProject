Shader "holistic/3-SurfaceReflective"
{
    Properties
    {
        _Color(" Tint ",Color)=(1,1,1,1)
        _MainTex(" Texture ",2D) = "white"{}
        _ColorMultiplier("RGB Range",Range(0,7))=1
        _CubeRef("Reflection Mapping ", CUBE) = ""{}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_MainTex;
            float3 worldPos;
            float3 worldRefl;
        };
        sampler2D _MainTex;
        fixed4 _Color;
        fixed _ColorMultiplier;
        samplerCUBE _CubeRef;
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo  = (tex2D(_MainTex, IN.uv_MainTex)* _ColorMultiplier* float4(0, 1, 0, 1)).rgb;
            //o.Emission = texCUBE(_CubeRef, IN.worldRefl);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
