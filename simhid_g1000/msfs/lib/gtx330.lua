local module = {
    width = 1112,
    height = 282,
    type = {
        general = 1,
    },
}

local module_defs = {
    prefix = "GTX330",
    activatable = false,
    options = {{}},
    option_defaults = {
        type = module.type.general,
    },
}

local common = require("lib/common")
--------------------------------------------------------------------------------------
-- action definitions
--------------------------------------------------------------------------------------
module.actions = {}
module.actions[1] = {
    ident = msfs.mfwasm.rpn_executer("(>K:XPNDR_IDENT_ON)"),
    vfr = msfs.mfwasm.rpn_executer("(>H:TransponderVFR)"),
    on = msfs.mfwasm.rpn_executer("(>H:TransponderON)"),
    off = msfs.mfwasm.rpn_executer("(>H:TransponderOFF)"),
    stby = msfs.mfwasm.rpn_executer("(>H:TransponderSTBY)"),
    alt = msfs.mfwasm.rpn_executer("(>H:TransponderALT)"),
    func = msfs.mfwasm.rpn_executer("(>H:TransponderFUNC)"),
    crsr = msfs.mfwasm.rpn_executer("(>H:TransponderCRSR)"),
    startstop= msfs.mfwasm.rpn_executer("(>H:TransponderSTARTSTOP)"),
    clr = msfs.mfwasm.rpn_executer("(>H:TransponderCLR)"),
    num0 = msfs.mfwasm.rpn_executer("(>H:Transponder0)"),
    num1 = msfs.mfwasm.rpn_executer("(>H:Transponder1)"),
    num2 = msfs.mfwasm.rpn_executer("(>H:Transponder2)"),
    num3 = msfs.mfwasm.rpn_executer("(>H:Transponder3)"),
    num4 = msfs.mfwasm.rpn_executer("(>H:Transponder4)"),
    num5 = msfs.mfwasm.rpn_executer("(>H:Transponder5)"),
    num6 = msfs.mfwasm.rpn_executer("(>H:Transponder6)"),
    num7 = msfs.mfwasm.rpn_executer("(>H:Transponder7)"),
    num8 = msfs.mfwasm.rpn_executer("(>H:Transponder8)"),
    num9 = msfs.mfwasm.rpn_executer("(>H:Transponder9)"),
}

--------------------------------------------------------------------------------------
-- operable area definitions
--------------------------------------------------------------------------------------
local attr_normal = {width=69.189, height=45.569, rratio=0.05}
local attr_portrate = {width=47.887, height=62.842, rratio=0.05}
local attr_alt = {width=47.211, height=47.211, rratio=0.5}
module_defs.operables = {}
module_defs.operables[module.type.general] = {
    ident = {x=25.693, y=45.803, attr=attr_normal},
    vfr = {x=25.693, y=120.552, attr=attr_normal},
    on = {x=150.054, y=22.1, attr=attr_normal},
    stby = {x=105.642, y=103.28, attr=attr_portrate},
    off = {x=215.212, y=103.28, attr=attr_portrate},
    alt = {x=161.043, y=79.063, attr=attr_alt},
    func = {x=920.375, y=45.803, attr=attr_normal},
    crsr = {x=1012.494, y=45.803, attr=attr_normal},
    startstop = {x=920.375, y=118.215, attr=attr_normal},
    clr = {x=1012.494, y=118.215, attr=attr_normal},
    num0 = {x=31.259, y=210.824, attr=attr_normal},
    num1 = {x=130.809, y=210.824, attr=attr_normal},
    num2 = {x=232.153, y=210.824, attr=attr_normal},
    num3 = {x=330.561, y=210.824, attr=attr_normal},
    num4 = {x=429.458, y=210.824, attr=attr_normal},
    num5 = {x=551.365, y=210.824, attr=attr_normal},
    num6 = {x=652.22, y=210.824, attr=attr_normal},
    num7 = {x=749.159, y=210.824, attr=attr_normal},
    num8 = {x=917.138, y=210.824, attr=attr_normal},
    num9 = {x=1010.16, y=210.824, attr=attr_normal},
}

--------------------------------------------------------------------------------------
-- captured window placeholder definition
--------------------------------------------------------------------------------------
module_defs.captured_window = {}
module_defs.captured_window[module.type.general] = {x=303, y=32, width=580, height=142}

--------------------------------------------------------------------------------------
-- prepare module scope environment
--------------------------------------------------------------------------------------
common.component_module_init(module, module_defs)

--------------------------------------------------------------------------------------
-- instance generator
--------------------------------------------------------------------------------------
function module.create_component(component_name, id, captured_window, x, y, scale, rctx, simhid_g1000)
    local component = common.component_module_create_instance(module, module_defs,{
        name = component_name,
        id = id,
        captured_window = captured_window,
        x = x, y = y, scale = scale,
        simhid_g1000 = simhid_g1000
    })

    -- update view background bitmap
    local background = graphics.bitmap("assets/gtx330.png")
    rctx:draw_bitmap{bitmap=background, x=x, y=y, scale=scale}

    return component
end

return module
