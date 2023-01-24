local changes = {
    -- Async / threaded stuff
    async_mode = 0,
    snd_mix_async = 1,
    mat_queue_mode = 2,
    gmod_mcore_test = 1,
    spawnicon_queue = 1,
    studio_queue_mode = 1,
    snd_async_fullyasync = 1,

    mod_load_mesh_async = 1,
    mod_load_anims_async = 1,
    mod_load_vcollide_async = 1,

    cl_threaded_bone_setup = 1,
    cl_threaded_client_leaf_system = 1,

    r_fastzreject = 1,
    r_queued_ropes = 1,
    r_queued_decals = 1,
    r_threaded_particles = 1,
    r_threaded_renderables = 1,
    r_queued_post_processing = 1,
    r_threaded_client_shadow_manager = 1,

    mat_reduceparticles = 1,
    mat_powersavingsmode = 1,

    -- Preferences with high performance impact
    r_decals = 25,
    prop_active_gib_limit = 0,

    -- Net settings
    net_queued_packet_thread = 1,
    net_splitpacket_maxrate = 2097152,
    net_udp_recvbuf = 131072,
    net_maxroutable = 1260,
    net_maxfragments = 1792,
    net_compresspackets = 1,
    net_compresspackets_minsize = 25000,
}

local function removeHooks()
    hook.Remove( "Think", "DOFThink" )
    hook.Remove( "RenderScene", "RenderSuperDoF" )
    hook.Remove( "PostRender", "RenderFrameBlend" )
    hook.Remove( "PreRender", "PreRenderFrameBlend" )
    hook.Remove( "PostDrawEffects", "RenderWidgets" )
    hook.Remove( "RenderScene", "RenderStereoscopy" )
    -- hook.Remove( "PostDrawEffects", "RenderHalos" )
    hook.Remove( "GUIMouseReleased", "SuperDOFMouseUp" )
    hook.Remove( "GUIMousePressed", "SuperDOFMouseDown" )
    hook.Remove( "NeedsDepthPass", "NeedsDepthPass_Bokeh" )
    hook.Remove( "RenderScreenspaceEffects", "RenderBloom" )
    hook.Remove( "RenderScreenspaceEffects", "RenderBokeh" )
    hook.Remove( "RenderScreenspaceEffects", "RenderToyTown" )
    hook.Remove( "RenderScreenspaceEffects", "RenderSunbeams" )
    hook.Remove( "RenderScreenspaceEffects", "RenderMotionBlur" )
    hook.Remove( "PreventScreenClicks", "SuperDOFPreventClicks" )
end

local function runCommands()
    for cvar, value in pairs( changes ) do
        RunConsoleCommand( cvar, value )
    end
end

local function disableWidgets()
    hook.Remove( "PlayerTick", "TickWidgets" )
end

local function enableEnhancements()
    removeHooks()
    runCommands()
    disableWidgets()
end

local function warnEnable( ply, source )
    local chatPrint = function( ... ) ply:ChatPrint( ... ) end
    local log = source == "chat" and chatPrint or print

    log( "[CFC Enhancements] Warning! This command may cause unintended side effects, such as stuttering or crashing" )
    log( "[CFC Enhancements] If you experience any issues, please simply rejoin the server" )
    log( "[CFC Enhancements] Enabling in two seconds..." )

    timer.Simple( 2, function()
        log( "[CFC Enhancements] Enabling CFC Performance Enhancements..." )
        enableEnhancements()
        log( "[CFC Enhancements] CFC Performance Enhancements enabled! Enjoy enhanced performance!" )
    end )
end

local function checkForEnableCommand( ply, message )
    if ply ~= LocalPlayer() then return end
    if message ~= "!perfon" then return end

    warnEnable( ply, "chat" )
end

hook.Remove( "OnPlayerChat", "CFC_EnablePerformance" )
hook.Add( "OnPlayerChat", "CFC_EnablePerformance", checkForEnableCommand )

concommand.Add( "cfc_enable_performance", function( ply )
    warnEnable( ply, "console" )
end )
