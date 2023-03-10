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

aw_wall_thickness = 1.0;

aw_action_major_cards_size = 9;
//aw_parent_exp_cards_size = 8;
aw_a_cards_size = 50;
aw_b_cards_size = 50;
//aw_c_cards_size = 50;
//aw_d_cards_size = 50;
//aw_fotm_cards_size = 42;

// Total cards size 268
// 113
aw_size_x =
  aw_wall_thickness + // 1
  aw_action_major_cards_size + // 9
  aw_wall_thickness + // 1
  aw_a_cards_size + // 50
  aw_wall_thickness + // 1
  aw_b_cards_size + // 50
  aw_wall_thickness; // 1

aw_size_y = 95.0;
aw_size_z = 70.0;


aw_cutout_height_pct = 60;

data =
  [
    [
      "simple box",
      [
        [ BOX_SIZE_XYZ, [aw_size_x, aw_size_y, aw_size_z] ],
        [ BOX_NO_LID_B, t],
        // Action/Major cards
        [
          BOX_COMPONENT,
          [
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                aw_action_major_cards_size,
                aw_size_y - 2 * aw_wall_thickness,
                aw_size_z - aw_wall_thickness
              ]
            ],
            [ CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
            [ CMP_CUTOUT_HEIGHT_PCT, aw_cutout_height_pct ],
            [ CMP_CUTOUT_DEPTH_PCT, 0 ],
            [CMP_NUM_COMPARTMENTS_XY, [1, 1]],
            [POSITION_XY, [0, CENTER]]
          ]
        ],
        // A/B deck cards
        [
          BOX_COMPONENT,
          [
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                aw_a_cards_size,
                aw_size_y - 2 * aw_wall_thickness,
                aw_size_z - aw_wall_thickness
              ]
            ],
            [ CMP_CUTOUT_SIDES_4B, [ t, t, t, t ] ],
            [ CMP_CUTOUT_HEIGHT_PCT, aw_cutout_height_pct ],
            [ CMP_CUTOUT_DEPTH_PCT, 0 ],
            [CMP_NUM_COMPARTMENTS_XY, [2, 1]],
            [
              POSITION_XY,
              [
                aw_action_major_cards_size +
                aw_wall_thickness,
                CENTER
              ]
            ]
          ]
        ],
      ]
    ]
  ];

MakeAll();