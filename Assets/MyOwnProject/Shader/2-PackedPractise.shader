Shader "Holistic/PackedShader"
{
    Properties
    {
       _Color("Color", Color) = (1,1,1,1)
       _Alpha("Alpha", float) = (1,1,1,1)
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color;
        fixed _Alpha;
        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Alpha = _Alpha.r ;
            o.Albedo = _Color.rgba;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
