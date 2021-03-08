Shader "holistic/3-SurfaceReflective"
{
    Properties
    {
        _Color(" Tint ",Color)=(1,1,1,1)
        _MainTex(" Texture ",2D) = "white"{}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_MainTex;
            
        };
        sampler2D _MainTex;
        fixed4 _Color;
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
