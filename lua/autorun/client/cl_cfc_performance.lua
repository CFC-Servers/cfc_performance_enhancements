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
    RunConsoleCommand("r_threaded_client_shadow_manager", "1")
    RunConsoleCommand("r_threaded_particles", "1")
    RunConsoleCommand("r_threaded_renderables", "1")
    RunConsoleCommand("r_queued_ropes", "1")
    RunConsoleCommand("studio_queue_mode", "1")
end

local function disableWidgets()
end

local function enableEnhancements()
    print( "[CFC Enhancements] Enabling CFC Performance Enhancements.." )

    -- Safety timer. Lets the last couple of things load up before we run the enhancements.
    timer.Simple(2, function()
        removeHooks()
        runCommands()
        disableWidgets()
        print( "[CFC Enhancements] CFC Performance Enhancements enabled! Enjoy enhanced performance!" )
    end)
end

local function playerIsLoaded()
    return IsValid(LocalPlayer())
end

local function handleWaiterTimeout()
    print( "[CFC Enhancements] CFC Waiter timed out! Enhancements won't be loaded." )
end

local function registerJobWithWaiter()
    local waiterLoaded = Waiter or nil

    if waiterLoaded then
        print( "[CFC Enhancements] Waiter is loaded. Registering job.." )
        Waiter.waitFor( playerIsLoaded, enableEnhancements, handleWaiterTimeout )
    else
        print( "[CFC Enhancements] Warning: Waiter wasn't loaded in time. Is it running? Inserting job into global queue, but don't rely on this to work." )
        WaiterQueue = WaiterQueue or {}

        local job = {}
        job["waitingFor"] = playerIsLoaded
        job["onSuccess"] = enableEnhancements
        job["onTimeout"] = handleWaiterTimeout

        table.insert( WaiterQueue, job )
    end
end

registerJobWithWaiter()
