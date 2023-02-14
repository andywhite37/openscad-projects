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

aw_size_x1 = 123.0;
aw_size_x2 = 95.0;
aw_size_x3 = 218.0;

aw_size_y1 = 40.0;
aw_size_y2 = 40.0;
aw_size_y3 = 80.0;

aw_size_z = 30.0;

// hack to make the bottom cutout take away the whole portion of the 3rd compartment
g_full_bottom_cutout = true;

data =
  [
    [
      "simple box",
      [
        [ BOX_SIZE_XYZ, [aw_size_x3, aw_size_y3, aw_size_z] ],
        [ BOX_NO_LID_B, t],

        // Smaller side compartment
        [
          BOX_COMPONENT,
          [
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                aw_size_x1 - 2 * g_wall_thickness,
                aw_size_y1 + 1, // Force it to overflow into the next area
                aw_size_z - g_wall_thickness
              ]
            ],
            [ CMP_NUM_COMPARTMENTS_XY, [1, 1] ],
            [ POSITION_XY, [0, 0] ]
          ]
        ],

        // Larger side compartment
        [
          BOX_COMPONENT,
          [
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                aw_size_x3 - 2 * g_wall_thickness,
                aw_size_y2 - 2 * g_wall_thickness,
                aw_size_z - g_wall_thickness
              ]
            ],
            [ CMP_NUM_COMPARTMENTS_XY, [1, 1] ],
            [ POSITION_XY, [0, 40] ]
          ]
        ],

        // Cut-out compartment
        [
          BOX_COMPONENT,
          [
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                aw_size_x2 * 2,
                aw_size_y2 * 2,
                aw_size_z * 2
              ]
            ],
            //[ CMP_SHAPE_ROTATED_B, f ],
            [ CMP_NUM_COMPARTMENTS_XY, [1, 1] ],
            [ POSITION_XY, [122, -aw_size_y2 - 1] ],
            //[ CMP_PADDING_HEIGHT_ADJUST_XY, [-10, -10]],
            [ CMP_CUTOUT_BOTTOM_B, t ], 
            //[ CMP_CUTOUT_WIDTH_PCT, -10 ]
            [ CMP_CUTOUT_DEPTH_PCT, 10 ]
          ]
        ],
      ]
    ]
  ];

MakeAll();