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
g_wall_thickness = 1.4;

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

aw_card_width = 44.0;
aw_card_height = 68.0;

aw_sleeve_factor = 2.0;

aw_base_player_cards_size = 10 * aw_sleeve_factor;
aw_base_exp_cards_size = 16 * aw_sleeve_factor;
aw_hh_demon_cards_size = 5 * aw_sleeve_factor;
aw_hh_exp_cards_size = 8 * aw_sleeve_factor;
aw_temples_player_cards_size = 10 * aw_sleeve_factor;
aw_temples_exp_cards_size = 16 * aw_sleeve_factor;
aw_german_cards_size = 24 + 4;

aw_box_x = 88.0; // 74.0;

// 8 * 1.5 + 20 + 32 + 10 + 16 + 20 + 32 + 28 = 170
aw_box_y =
  g_wall_thickness +
  aw_base_player_cards_size +
  g_wall_thickness +
  aw_base_exp_cards_size +
  g_wall_thickness +
  aw_hh_demon_cards_size +
  g_wall_thickness +
  aw_hh_exp_cards_size +
  g_wall_thickness +
  aw_temples_player_cards_size +
  g_wall_thickness +
  aw_temples_exp_cards_size +
  g_wall_thickness +
  aw_german_cards_size +
  g_wall_thickness;

aw_box_z = 66.0;

aw_cutout_width_pct = 50;
aw_cutout_height_pct = 60;

data =
  [
    [
      "hex tile box",
      [
        [ BOX_SIZE_XYZ, [aw_box_x, aw_box_y, aw_box_z] ],
        [ BOX_NO_LID_B, t],
        // Base player
        [
          BOX_COMPONENT,
          [
            [ CMP_NUM_COMPARTMENTS_XY, [1, 1] ],
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                aw_box_x - 2 * g_wall_thickness,
                aw_base_player_cards_size,
                aw_box_z - 1 * g_wall_thickness
              ]
            ],
            [ POSITION_XY, [ CENTER, 0 ] ],
            [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
            [ CMP_CUTOUT_DEPTH_PCT, 0 ],
            [ CMP_CUTOUT_WIDTH_PCT, aw_cutout_width_pct ],
            [ CMP_CUTOUT_HEIGHT_PCT, aw_cutout_height_pct ],
          ]
        ],
        // Base exp
        [
          BOX_COMPONENT,
          [
            [ CMP_NUM_COMPARTMENTS_XY, [1, 1] ],
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                aw_box_x - 2 * g_wall_thickness,
                aw_base_exp_cards_size,
                aw_box_z - 1 * g_wall_thickness
              ]
            ],
            [ POSITION_XY,
              [
                CENTER,
                aw_base_player_cards_size +
                  g_wall_thickness
              ]
            ],
            [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
            [ CMP_CUTOUT_DEPTH_PCT, 0 ],
            [ CMP_CUTOUT_WIDTH_PCT, aw_cutout_width_pct ],
            [ CMP_CUTOUT_HEIGHT_PCT, aw_cutout_height_pct ],
          ]
        ],                            
        // H&H demon
        [
          BOX_COMPONENT,
          [
            [ CMP_NUM_COMPARTMENTS_XY, [1, 1] ],
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                aw_box_x - 2 * g_wall_thickness,
                aw_hh_demon_cards_size,
                aw_box_z - 1 * g_wall_thickness
              ]
            ],
            [ POSITION_XY,
              [
                CENTER,
                aw_base_player_cards_size +
                  g_wall_thickness +
                  aw_base_exp_cards_size +
                  g_wall_thickness
              ]
            ],
            [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
            [ CMP_CUTOUT_DEPTH_PCT, 0 ],
            [ CMP_CUTOUT_WIDTH_PCT, aw_cutout_width_pct ],
            [ CMP_CUTOUT_HEIGHT_PCT, aw_cutout_height_pct ],
          ]
        ],                            
        // H&H exp
        [
          BOX_COMPONENT,
          [
            [ CMP_NUM_COMPARTMENTS_XY, [1, 1] ],
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                aw_box_x - 2 * g_wall_thickness,
                aw_hh_exp_cards_size,
                aw_box_z - 1 * g_wall_thickness
              ]
            ],
            [ POSITION_XY,
              [
                CENTER,
                aw_base_player_cards_size +
                  g_wall_thickness +
                  aw_base_exp_cards_size +
                  g_wall_thickness +
                  aw_hh_demon_cards_size +
                  g_wall_thickness
              ]
            ],
            [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
            [ CMP_CUTOUT_DEPTH_PCT, 0 ],
            [ CMP_CUTOUT_WIDTH_PCT, aw_cutout_width_pct ],
            [ CMP_CUTOUT_HEIGHT_PCT, aw_cutout_height_pct ],
          ]
        ],                            
        // Temples player
        [
          BOX_COMPONENT,
          [
            [ CMP_NUM_COMPARTMENTS_XY, [1, 1] ],
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                aw_box_x - 2 * g_wall_thickness,
                aw_temples_player_cards_size,
                aw_box_z - 1 * g_wall_thickness
              ]
            ],
            [ POSITION_XY,
              [
                CENTER,
                aw_base_player_cards_size +
                  g_wall_thickness +
                  aw_base_exp_cards_size +
                  g_wall_thickness +
                  aw_hh_demon_cards_size +
                  g_wall_thickness +
                  aw_hh_exp_cards_size +
                  g_wall_thickness
              ]
            ],
            [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
            [ CMP_CUTOUT_DEPTH_PCT, 0 ],
            [ CMP_CUTOUT_WIDTH_PCT, aw_cutout_width_pct ],
            [ CMP_CUTOUT_HEIGHT_PCT, aw_cutout_height_pct ],
          ]
        ],                            
        // Temples exp
        [
          BOX_COMPONENT,
          [
            [ CMP_NUM_COMPARTMENTS_XY, [1, 1] ],
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                aw_box_x - 2 * g_wall_thickness,
                aw_temples_exp_cards_size,
                aw_box_z - 1 * g_wall_thickness
              ]
            ],
            [ POSITION_XY,
              [
                CENTER,
                aw_base_player_cards_size +
                  g_wall_thickness +
                  aw_base_exp_cards_size +
                  g_wall_thickness +
                  aw_hh_demon_cards_size +
                  g_wall_thickness +
                  aw_hh_exp_cards_size +
                  g_wall_thickness +
                  aw_temples_player_cards_size +
                  g_wall_thickness
              ]
            ],
            [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
            [ CMP_CUTOUT_DEPTH_PCT, 0 ],
            [ CMP_CUTOUT_WIDTH_PCT, aw_cutout_width_pct ],
            [ CMP_CUTOUT_HEIGHT_PCT, aw_cutout_height_pct ],
          ]
        ],                            
        // Extra/German cards
        [
          BOX_COMPONENT,
          [
            [ CMP_NUM_COMPARTMENTS_XY, [1, 1] ],
            [
              CMP_COMPARTMENT_SIZE_XYZ,
              [
                aw_box_x - 2 * g_wall_thickness,
                aw_german_cards_size,
                aw_box_z - 1 * g_wall_thickness
              ]
            ],
            [ POSITION_XY,
              [
                CENTER,
                aw_base_player_cards_size +
                  g_wall_thickness +
                  aw_base_exp_cards_size +
                  g_wall_thickness +
                  aw_hh_demon_cards_size +
                  g_wall_thickness +
                  aw_hh_exp_cards_size +
                  g_wall_thickness +
                  aw_temples_player_cards_size +
                  g_wall_thickness +
                  aw_temples_exp_cards_size +
                  g_wall_thickness
              ]
            ],
            [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
            [ CMP_CUTOUT_DEPTH_PCT, 0 ],
            [ CMP_CUTOUT_WIDTH_PCT, aw_cutout_width_pct ],
            [ CMP_CUTOUT_HEIGHT_PCT, aw_cutout_height_pct ],
          ]
        ],                            
      ]
    ],
  ];


MakeAll();