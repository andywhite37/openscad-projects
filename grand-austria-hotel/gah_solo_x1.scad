include <boardgame_insert_toolkit_lib.2.scad>;

// determines whether lids are output.
g_b_print_lid = true;

// determines whether boxes are output.
g_b_print_box = true; 

// Focus on one box
g_isolated_print_box = ""; 

// Used to visualize how all of the boxes fit together. 
g_b_visualization = false;          
        
// this is the outer wall thickness. 
//Default = 1.5mm
g_wall_thickness = 1.0;

// The tolerance value is extra space put between planes of the lid and box that fit together.
// Increase the tolerance to loosen the fit and decrease it to tighten it.
//
// Note that the tolerance is applied exclusively to the lid.
// So if the lid is too tight or too loose, change this value ( up for looser fit, down for tighter fit ) and 
// you only need to reprint the lid.
// 
// The exception is the stackable box, where the bottom of the box is the lid of the box below,
// in which case the tolerance also affects that box bottom.
//
g_tolerance = 0.15;

// This adjusts the position of the lid detents downward. 
// The larger the value, the bigger the gap between the lid and the box.
g_tolerance_detents_pos = 0.1;

aw_size_x = 54.0;
aw_size_y = 77.0;
aw_size_z = 18.0;


data =
  [
    [
      "simple box",
      [
        [ BOX_SIZE_XYZ, [aw_size_x, aw_size_y, aw_size_z] ],
        [ BOX_NO_LID_B, t],
        [
          BOX_COMPONENT,
          [
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                (aw_size_x - 2.0),
                (aw_size_y - 2.0),
                aw_size_z - g_wall_thickness
              ]
            ],
            [ CMP_NUM_COMPARTMENTS_XY, [1, 1] ],
            [ POSITION_XY, [0, 0] ],
            //[ CMP_CUTOUT_SIDES_4B,   [t,f,f,f]],
            //[ CMP_CUTOUT_DEPTH_PCT,  20],
            //[ CMP_CUTOUT_WIDTH_PCT,  50],
            //[ CMP_CUTOUT_HEIGHT_PCT, 100], 
            //[ CMP_SHAPE_ROTATED_B, t ],
            [ CMP_SHAPE, FILLET ],
            //[ CMP_FILLET_RADIUS, 5.0 ],
          ]
        ],
      ]
    ]
  ];

MakeAll();