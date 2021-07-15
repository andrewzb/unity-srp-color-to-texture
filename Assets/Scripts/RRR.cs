using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class RRR : MonoBehaviour
{
    [SerializeField] private Camera camera = null;
    [SerializeField] private Material cameraMat = null;

    private void Start()
    {
        //camera.depthTextureMode = DepthTextureMode.Depth;
    }

    private void OnEnable()
    {
        if (camera == null)
            camera = Camera.main;
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, cameraMat);
    }
}
