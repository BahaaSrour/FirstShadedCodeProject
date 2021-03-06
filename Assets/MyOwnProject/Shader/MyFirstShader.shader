Shader "holistic/MyFirstShader"
{
    Properties
    {
        _Color("Albedo", Color) = (1,1,1,1)
        _Emission("Emission",Range(0,1))=0.0
        //_MainTex ("Albedo (RGB)", 2D) = "white" {}
        //_Glossiness ("Smoothness", Range(0,1)) = 0.5
        //_Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        // Use shader model 3.0 target, to get nicer looking lighting

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;
        half _Emission;
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            /*fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            o.Alpha = c.a;*/

            o.Albedo = _Color.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
