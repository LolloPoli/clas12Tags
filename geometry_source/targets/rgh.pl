# use strict;
use warnings;

use lib ("../");
use clas12_configuration_string;

our %configuration;
our %parameters;

sub build_rgh_cryocan {

    my %detector = init_det();

    # Main cryocan volume
    $detector{"name"}        = "cryocan";
    $detector{"mother"}      = "root";
    $detector{"description"} = "cryo can volume";
    $detector{"pos"}         = "0*cm 0*cm 0*mm";
    $detector{"rotation"}    = "90*deg 0*deg 0*deg";
    $detector{"color"}       = "0000ff3";
    $detector{"type"}        = "Tube";
    $detector{"dimensions"}  = "0*mm 325.5*mm 400*mm 0*deg 360*deg";
    $detector{"material"}    = "G4_Galactic";
    $detector{"style"}       = 1;
    print_det(\%configuration, \%detector);


    # Cryo exit window
    %detector = init_det();
    $detector{"name"}        = "cryo_exitwind";
    $detector{"mother"}      = "cryocan";
    $detector{"description"} = "cryo can exit window";
    $detector{"pos"}         = "0*cm 0*cm 0*mm";
    $detector{"rotation"}    = "0*deg 0*deg 0*deg";
    $detector{"color"}       = "99ffaa";
    $detector{"type"}        = "Tube";
    $detector{"dimensions"}  = "325*mm 325.05*mm 165*mm 200*deg 140*deg";
    $detector{"material"}    = "G4_Al";
    $detector{"style"}       = 1;
    print_det(\%configuration, \%detector);


    # Radiation shield
    %detector = init_det();
    $detector{"name"}        = "cryo_RSshield";
    $detector{"mother"}      = "cryocan";
    $detector{"description"} = "cryo can radiation shield";
    $detector{"pos"}         = "0*cm 0*cm 0*mm";
    $detector{"rotation"}    = "0*deg 0*deg 0*deg";
    $detector{"color"}       = "99ffaa";
    $detector{"type"}        = "Tube";
    $detector{"dimensions"}  = "299.96*mm 300*mm 152*mm 200*deg 140*deg";
    $detector{"material"}    = "G4_Al";
    $detector{"style"}       = 1;
    print_det(\%configuration, \%detector);


    # Cryo flange
    %detector = init_det();
    $detector{"name"}        = "cryo_flange";
    $detector{"mother"}      = "cryocan";
    $detector{"description"} = "cryo can flange";
    $detector{"pos"}         = "0*cm 0*cm -380*mm";
    $detector{"rotation"}    = "0*deg 0*deg 0*deg";
    $detector{"color"}       = "99ffaa";
    $detector{"type"}        = "Tube";
    $detector{"dimensions"}  = "0*mm 320*mm 10*mm 0*deg 360*deg";
    $detector{"material"}    = "G4_STAINLESS-STEEL";
    $detector{"style"}       = 1;
    print_det(\%configuration, \%detector);

}

sub build_rgh_target {
    my %detector = init_det();
    # NH3 target cell
    %detector = init_det();
    $detector{"name"}        = "ttargetCell";
    $detector{"mother"}      = "cryocan";
    $detector{"description"} = "Target Container";
    $detector{"pos"}         = "0*mm 0*mm 0*mm";
    $detector{"rotation"}    = "-90*deg 0*deg 0*deg";
    $detector{"color"}       = "994422";
    $detector{"type"}        = "Tube";
    $detector{"dimensions"}  = "0*mm 13.5*mm 14.2*mm 0*deg 360*deg";
    $detector{"material"}    = "NH3target";
    $detector{"style"}       = 1;
    print_det(\%configuration, \%detector);


    # Entrance aluminum window
    %detector = init_det();
    $detector{"name"}        = "al_window_entrance";
    $detector{"mother"}      = "cryocan";
    $detector{"description"} = "25 um thick aluminum window upstream";
    $detector{"pos"}         = "0*mm 14.2125*mm 0*mm";
    $detector{"rotation"}    = "-90*deg 0*deg 0*deg";
    $detector{"color"}       = "aaaaff";
    $detector{"type"}        = "Tube";
    $detector{"dimensions"}  = "0*mm 13.5*mm 0.0125*mm 0*deg 360*deg";
    $detector{"material"}    = "G4_Al";
    $detector{"style"}       = 1;
    print_det(\%configuration, \%detector);


    # Exit aluminum window
    %detector = init_det();
    $detector{"name"}        = "al_window_exit";
    $detector{"mother"}      = "cryocan";
    $detector{"description"} = "25 um thick aluminum window downstream";
    $detector{"pos"}         = "0*mm -14.2125*mm 0*mm";
    $detector{"rotation"}    = "-90*deg 0*deg 0*deg";
    $detector{"color"}       = "aaaaff";
    $detector{"type"}        = "Tube";
    $detector{"dimensions"}  = "0*mm 13.5*mm 0.0125*mm 0*deg 360*deg";
    $detector{"material"}    = "G4_Al";
    $detector{"style"}       = 1;
    print_det(\%configuration, \%detector);
}

sub build_rgh_target_materials {
    
    # liquid helium coolant
    my %mat = init_mat();
    $mat{"name"} = "lHeCoolant";
    $mat{"description"} = "liquid He coolant";
    $mat{"density"} = "0.147";
    $mat{"ncomponents"} = "1";
    $mat{"components"} = "G4_He 1";
    print_mat(\%configuration, \%mat);

    # NH3
    %mat = init_mat();
    my $NH3_density = 0.867;
    my $N_mass_fraction = 15.0 / 18.0;
    my $H_mass_fraction = 3.0 / 18.0;
    $mat{"name"} = "NH3";
    $mat{"description"} = "NH3 material";
    $mat{"density"} = $NH3_density;
    $mat{"ncomponents"} = "2";
    $mat{"components"} = "G4_N $N_mass_fraction G4_H $H_mass_fraction";
    print_mat(\%configuration, \%mat);

    # NH3 target
    %mat = init_mat();
    my $NH3trg_density = 0.6 * 0.867 + 0.4 * 0.145;
    my $NH3_mass_fraction = 0.6 * 0.867 / $NH3trg_density;
    my $lHe_mass_fraction = 0.4 * 0.145 / $NH3trg_density;
    $mat{"name"} = "NH3target";
    $mat{"description"} = "solid NH3 target";
    $mat{"density"} = $NH3trg_density;
    $mat{"ncomponents"} = "2";
    $mat{"components"} = "NH3 $NH3_mass_fraction lHeCoolant $lHe_mass_fraction";
    print_mat(\%configuration, \%mat);
}

sub build_rgh {
    build_rgh_cryocan();
    build_rgh_target();
}

1;