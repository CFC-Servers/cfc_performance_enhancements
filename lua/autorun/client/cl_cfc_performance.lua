local changes = {

    cl_fasttempentcollision = 60,
    r_WaterDrawReflection = 0,
    r_waterforceexpensive = 0,
    r_waterforcereflectentities = 0,
    r_WaterDrawRefraction = 0,
    r_ForceWaterLeaf = 1,
    r_particle_sim_spike_threshold_ms = 0, -- Gimp the particle simulation system

    mat_bloom_scalefactor_scalar = 0,
    mat_non_hdr_bloom_scalefactor = 0,

    -- Disable facial animations, skips processing all face bones
    r_flex = 0,
    flex_rules = 0,
    flex_smooth = 0,

    anim_3wayblend = 0,

    tracer_extra = 0,

    -- Preferences with high performance impact
    r_decals = 25,
    mp_decals = 25,
    r_drawbatchdecals = 0,
    r_decal_cullsize = 256, -- Hide all but the biggest decals
    r_maxmodeldecal = 4, -- Lower max number of decals on a single model
    r_decal_cover_count = 1, -- Only allow 1 decal to cover another

    -- Fade map overlays
    r_overlayfadeenable = 1,
    r_overlayfademax = 2000,
    r_overlayfademin = 1750,

    -- Disable gibs
    prop_active_gib_limit = 0,
    props_break_max_pieces = 0,
    violence_agibs = 0,
    violence_hgibs = 0,

    -- Net settings
    net_queued_packet_thread = 1,
}

-- May cause issues on some systems
local experimental = {
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

    r_queued_ropes = 1,
    r_queued_decals = 1,
    r_threaded_particles = 1,
    r_threaded_renderables = 1,
    r_queued_post_processing = 1,
    r_threaded_client_shadow_manager = 1,

    r_norefresh = 1, -- "Do not store a useless and unused frame time variable"

    filesystem_buffer_size = 65536,
    filesystem_max_stdio_read = 64,
    filesystem_unbuffered_io = 1,
}

-- Has very noticable impact on the game, or perhaps offer only a minor performance gain
local extreme = {
    mat_bumpmap = 0,                              -- Disable bumpmapping, causes a weird sheen on everything (causes the game to lag for a moment)
    mat_picmip = 1,                               -- Very noticable, maybe not helpful. Makes textures lower resolution, but use less memory

    r_eyemove = 0,
    r_glint_procedural = 1, -- Use CPU eye glinting - good for weak GPUs

    phonemesnap = 0, -- Prevent crossfading a second lip sync
    phonemefilter = 0.001, -- Do not box filter lip sync

    mp_usehwmvcds = -1, -- Force "hw morph" facial expressions off
    mp_usehwmmodels = -1, -- Force "hw morph models" off

    cl_phys_props_enable = 0, -- Disable clientside phyics props. Needs a rejoin to take effect
    r_staticprop_lod = 6, -- Heavily reduce static prop LoD

    mat_viewportscale = 0.6, -- 60% render resolution - quite noticable

    r_occlusion = 1, -- Use the CPU to determine when to render something rather than the GPU
    mat_tonemapping_occlusion_use_stencil = 1, -- Saves GPU cost by using the stencil buffer for occlusion

    r_pixelfog = 0, -- Greatly harms fog visibility but eases GPU load
}

-- Will likely affect the visual experience of the game
local extra = {
    cl_show_splashes = 0, -- Don't show water splashes
    r_fastzreject = 1, -- "... Fast z-setting algorithm to take advantage of hardware with fast z reject"

    mat_postprocessing_combine = 0,
    mat_disable_bloom = 1,
    mat_hdr_enabled = 0,
    mat_hdr_level = 0,

    -- Lighting stuff
    r_dynamic = 0, -- Disable dynamic
    r_ambientboost = 0, -- Do not boost reflected light
    r_ambientmin = 0, -- Disable ambient boost for all levels
    r_rimlight = 0, -- Disable Rimlight effect (uses GPU only)
    r_maxdlights = 0, -- Set max dynamic lights to 0
    r_worldlights = 0, -- Set max world lights applied to a vertex to 0 (default 4)
    r_worldlightmin = 0.1, -- Disable minor world lighting

    -- AA Settings
    mat_antialias = 1,
    mat_aaquality = 0,
    mat_alphacoverage = 0,
    mat_software_aa_strength = 0,
    mat_software_aa_strength_vgui = 0,
    mat_software_aa_edge_threshold = 0.5,
    mat_software_aa_blur_one_pixel_lines = 0.5,

    mat_colcorrection_disableentities = 1, -- Disable color correction on entities

    -- Filtering settings
    mat_trilinear = 1,                            -- Force triliner filtering
    mat_forceaniso = 1,                           -- Force anisotrphic filtering off
    mat_disable_fancy_blending = 1,

    r_teeth = 0, -- Strip the chompers
    r_eyes = 0, -- No more peepers, decent FPS bump

    -- Disable decals entirely
    r_decals = 0,
    mp_decals = 0,

    ragdoll_sleepaftertime = 0, -- Instantly put ragdolls to sleep
    r_decalstaticprops = 0, -- Skip some static prop lighting, prevent decals on static props
    cl_phys_props_max = 5, -- Cap clientside physics props

    r_drawdetailprops = 0, -- Disable detail props

    mat_viewportscale = 0.8, -- 80% render resolution

    r_3dsky = 0, -- Disable 3d skybox
    r_dopixelvisibility = 0, -- Visibility testing for lights, halos, etc
    r_pixelvisibility_partial = 0, -- Disable costly visiblity check

    cl_drawmonitors = 0, -- Disable monitor drawing
}


-- Little chance of hurting play experience or making the game look horrible
local safe = {
    r_drawflecks = 0, -- Don't draw flecks when hitting/shooting objects or the world
    r_lightaverage = 0, -- Useless CPU hog
    mat_reduceparticles = 1,
    mat_disable_lightwarp = 1,

    r_decal_overlap_area = 0.4, -- Set overlap area very small
    r_decal_overlap_count = 0, -- Prevent overlapping decals

    -- Disable motion blur
    mat_motion_blur_enabled = 0,
    mat_motion_blur_forward_enabled = 0,
    mat_motion_blur_strength = 0,

    ai_expression_optimization = 0, -- Disable npc background expressions when you can't see them.
    ai_expression_frametime = 0, -- Disable expressions entirely

    r_renderoverlayfragment = 0, -- Disable map overlays entirely
    r_drawopaquestaticpropslast = 1, -- Adjust static prop render order

    mat_viewportscale = 0.9, -- 90% render resolution

    -- Rope optimizations
    rope_smooth = 0, -- Disable rope smoothing
    r_ropetranslucent = 0, -- "Skip simulating ropes"
    rope_subdiv = 0, -- Skip heavy loops for rope subdivision
    rope_collide = 0, -- Disable rope-world collision checks
    rope_averagelight = 0, -- Offload the work of lighting ropes from the gpu to the cpu (should this be in extra?)

    engine_no_focus_sleep = 25, -- Throttle the engine more aggressively when tabbing out
    r_occlusion = 0, -- Save on CPU cost by having the GPU decide when to render something
    r_occluderminarea = 5, -- Skip occlusion checking on things that take up less than 5% of our screenspace

    host_flush_threshold = 0, -- Disable unused flushing task

    fast_fogvolume = 1, -- Use a fast path method to find the visible fog volume
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
