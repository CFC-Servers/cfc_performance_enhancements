AddCSLuaFile()

local function removeHooks()
    hook.Remove("GUIMousePressed", "SuperDOFMouseDown")
    hook.Remove("GUIMouseReleased", "SuperDOFMouseUp")
    hook.Remove("PreventScreenClicks", "SuperDOFPreventClicks")
    hook.Remove("PostRender", "RenderFrameBlend")
    hook.Remove("PreRender", "PreRenderFrameBlend")
    hook.Remove("PostDrawEffects", "RenderWidgets")
    --hook.Remove("PostDrawEffects", "RenderHalos")
    hook.Remove("RenderScene", "RenderStereoscopy")
    hook.Remove("RenderScene", "RenderSuperDoF")
    hook.Remove("RenderScreenspaceEffects", "RenderBloom")
    hook.Remove("RenderScreenspaceEffects", "RenderBokeh")
    hook.Remove("RenderScreenspaceEffects", "RenderColorModify")
    hook.Remove("RenderScreenspaceEffects", "RenderMaterialOverlay")
    hook.Remove("RenderScreenspaceEffects", "RenderMotionBlur")
    hook.Remove("RenderScreenspaceEffects", "RenderSharpen")
    hook.Remove("RenderScreenspaceEffects", "RenderSobel")
    hook.Remove("RenderScreenspaceEffects", "RenderSunbeams")
    hook.Remove("RenderScreenspaceEffects", "RenderTexturize")
    hook.Remove("RenderScreenspaceEffects", "RenderToyTown")
    hook.Remove("Think", "DOFThink")
    hook.Remove("NeedsDepthPass", "NeedsDepthPass_Bokeh")
end

local function runCommands()
    RunConsoleCommand("cl_threaded_bone_setup", "1")
    RunConsoleCommand("cl_threaded_client_leaf_system", "1")
    RunConsoleCommand("gmod_mcore_test", "1") -- It was suggested to set this value to -2 for some reason
    RunConsoleCommand("mat_queue_mode", "-1")
    RunConsoleCommand("r_decals", "25") -- Max Decals
    RunConsoleCommand("r_queued_decals", "1")-- potentially unstable
    RunConsoleCommand("r_queued_ropes", "1") -- potentially unstable
    RunConsoleCommand("r_queued_post_processing", "1")
    RunConsoleCommand("r_threaded_client_shadow_manager", "1")
    RunConsoleCommand("r_threaded_particles", "1")
    RunConsoleCommand("r_threaded_renderables", "1")
    RunConsoleCommand("r_queued_ropes", "1")
    RunConsoleCommand("studio_queue_mode", "1")
    RunConsoleCommand("prop_active_gib_limit", "0")
    RunConsoleCommand("snd_mix_async", "1") --Multithreaded sound. Causes the first few milliseconds of sounds to be cut off on some systems.
end

local function disableWidgets()
end

local function enableEnhancements( ply )
    print( "[CFC Enhancements] Enabling CFC Performance Enhancements.." )

    removeHooks()
    runCommands()
    disableWidgets()

    print( "[CFC Enhancements] CFC Performance Enhancements enabled! Enjoy enhanced performance!" )
end

local function checkForEnableCommand( ply, message )
    if ply ~= LocalPlayer() then return end
    if message ~= "!perfon" then return end

    ply:ChatPrint( "[CFC Enhancements] Warning! This command may cause unintended side effects, such as stuttering or crashing" )
    ply:ChatPrint( "[CFC Enhancements] If you experience any issues, please simply rejoin the server" )
    ply:ChatPrint( "[CFC Enhancements] Enabling in two seconds.." )

    timer.Simple( 2, enableEnhancements )
end
