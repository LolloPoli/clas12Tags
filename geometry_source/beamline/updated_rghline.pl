use strict;
use warnings;

our %configuration;

sub updated_rghline() {

    my $pipeLength = 72.5;
    my $zpos = 727.5;
    my $firstVacuumIR = 0.;
    my $firstVacuumOR = 34.925;


    # not running volumes that are currently malformed because hdice geometry is not yet implemented correctly
    my %detector = init_det();

    $pipeLength = 812.695;
    $zpos = 1600.105;
    $firstVacuumIR = 33.275;
    $firstVacuumOR = 34.925;

    %detector = init_det();
    $detector{"name"} = "vacuumPipe1_2";
    $detector{"mother"} = "root";
    $detector{"description"} = "straightVacuumPipe 2.75 inch OD 0.065 thick ";
    $detector{"color"} = "990000";
    $detector{"type"} = "Tube";
    $detector{"pos"} = "0*mm 0*mm $zpos*mm";
    $detector{"dimensions"} = "$firstVacuumIR*mm $firstVacuumOR*mm $pipeLength*mm 0*deg 360*deg";
    $detector{"material"} = "G4_STAINLESS-STEEL";
    $detector{"style"} = 1;
    print_det(\%configuration, \%detector);

    $zpos = 0;
    #$pipeLength = 728.4;
    $firstVacuumIR = 0;
    $firstVacuumOR = 33.274;

    %detector = init_det();
    $detector{"name"} = "vacuumInPipe1_2";
    $detector{"mother"} = "vacuumPipe1_2";
    $detector{"description"} = "straightVacuumPipe";
    $detector{"color"} = "551111";
    $detector{"type"} = "Tube";
    $detector{"pos"} = "0*mm 0*mm $zpos*mm";
    $detector{"dimensions"} = "$firstVacuumIR*mm $firstVacuumOR*mm $pipeLength*mm 0*deg 360*deg";
    $detector{"material"} = "G4_Galactic";
    $detector{"style"} = 1;
    print_det(\%configuration, \%detector);

    $zpos = 2621.735;
    $firstVacuumIR = 33.275;
    $firstVacuumOR = 34.925;
    $pipeLength = 132.235;
    %detector = init_det();
    $detector{"name"} = "vacuumPipe2";
    $detector{"mother"} = "root";
    $detector{"description"} = "straightVacuumPipe";
    $detector{"color"} = "008800";
    $detector{"type"} = "Tube";
    $detector{"pos"} = "0*mm 0*mm $zpos*mm";
    $detector{"dimensions"} = "$firstVacuumIR*mm $firstVacuumOR*mm $pipeLength*mm 0*deg 360*deg";
    $detector{"material"} = "G4_STAINLESS-STEEL";
    $detector{"style"} = 1;
    print_det(\%configuration, \%detector);

    $zpos = 0.;
    $firstVacuumIR = 0.;
    $firstVacuumOR = 33.274;
    #$pipeLength = 132.235;
    %detector = init_det();
    $detector{"name"} = "vacuumInPipe2";
    $detector{"mother"} = "vacuumPipe2";
    $detector{"description"} = "straightVacuumPipe";
    $detector{"color"} = "115511";
    $detector{"type"} = "Tube";
    $detector{"dimensions"} = "$firstVacuumIR*mm $firstVacuumOR*mm $pipeLength*mm 0*deg 360*deg";
    $detector{"material"} = "G4_Galactic";
    $detector{"style"} = 1;
    print_det(\%configuration, \%detector);

    $zpos = 2451.15;
    $firstVacuumIR = 33.275;
    $firstVacuumOR = 34.925;
    $pipeLength = 38.15;
    %detector = init_det();
    $detector{"name"} = "vacuumPipe3";
    $detector{"mother"} = "root";
    $detector{"description"} = "straightVacuumPipe";
    $detector{"color"} = "116699";
    $detector{"type"} = "Tube";
    $detector{"pos"} = "0*mm 0*mm $zpos*mm";
    $detector{"dimensions"} = "$firstVacuumIR*mm $firstVacuumOR*mm $pipeLength*mm 0*deg 360*deg";
    $detector{"material"} = "G4_STAINLESS-STEEL";
    $detector{"style"} = 1;
    print_det(\%configuration, \%detector);

    $firstVacuumOR = 33.274;
    %detector = init_det();
    $detector{"name"} = "vacuumInPipe3";
    $detector{"mother"} = "vacuumPipe3";
    $detector{"description"} = "straightVacuumPipe";
    $detector{"color"} = "111155";
    $detector{"type"} = "Tube";
    $detector{"pos"} = "0*mm 0*mm $zpos*mm";
    $detector{"dimensions"} = "0*mm $firstVacuumOR*mm $pipeLength*mm 0*deg 360*deg";
    $detector{"material"} = "G4_Galactic";
    $detector{"style"} = 1;
    print_det(\%configuration, \%detector);


    # new vacuum line
    my $nplanes = 7;
    my @iradius_pipe = (33.275, 33.275, 60.325, 60.325, 64.0, 64.0, 64.0);
    my @oradius_pipe = (34.925, 34.925, 63.5, 63.5, 68.0, 68.0, 68.0);
    my @z_plane_pipe = (2754.17, 5016, 5064, 5732, 5741, 9400, 13900); #or 13900??

    # VACUUM PIPE 1 
    %detector = init_det();
    $detector{"name"} = "vacuumPipe";
    $detector{"mother"} = "root";
    $detector{"description"} = "vacuumPipe beampipe";
    $detector{"color"} = "aaffff";
    $detector{"type"} = "Polycone";

    my $dimen = "0.0*deg 360*deg $nplanes*counts";
    for (my $i = 0; $i < $nplanes; $i++) { $dimen .= " $iradius_pipe[$i]*mm"; }
    for (my $i = 0; $i < $nplanes; $i++) { $dimen .= " $oradius_pipe[$i]*mm"; }
    for (my $i = 0; $i < $nplanes; $i++) { $dimen .= " $z_plane_pipe[$i]*mm"; }

    $detector{"dimensions"} = $dimen;
    $detector{"material"} = "G4_STAINLESS-STEEL";
    $detector{"style"} = 1;
    print_det(\%configuration, \%detector);

    # VACUUM INSIDE PIPE 1
    my @iradius_vac = (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    my @oradius_vac = (33.264, 33.264, 60.314, 60.314, 63.98, 63.98, 63.98);

    %detector = init_det();
    $detector{"name"} = "vacuumInPipe";
    $detector{"mother"} = "vacuumPipe";
    $detector{"description"} = "vacuum inside vacuumPipe";
    $detector{"color"} = "aaffff";
    $detector{"type"} = "Polycone";

    $dimen = "0.0*deg 360*deg $nplanes*counts";
    for (my $i = 0; $i < $nplanes; $i++) { $dimen .= " $iradius_vac[$i]*mm"; }
    for (my $i = 0; $i < $nplanes; $i++) { $dimen .= " $oradius_vac[$i]*mm"; }
    for (my $i = 0; $i < $nplanes; $i++) { $dimen .= " $z_plane_pipe[$i]*mm"; }

    $detector{"dimensions"} = $dimen;
    $detector{"material"} = "G4_Galactic";
    $detector{"style"} = 1;

    print_det(\%configuration, \%detector);

    # old cone
    if ($configuration{"variation"} eq "rgh_test2026_nocone") {
        $zpos = 1013.25;
        %detector = init_det();
        $detector{"name"} = "Cone1_2";
        $detector{"mother"} = "root";
        $detector{"description"} = "AngelaBrenna Tungsten Tip";
        $detector{"color"} = "551155";
        $detector{"type"} = "Cons";
        $detector{"pos"} = "0*mm 0*mm $zpos*mm";
        $detector{"dimensions"} = "38.1*mm 61.3313*mm 38.1*mm 98.64*mm 213.25*mm 0.0*deg 360*deg";
        $detector{"material"} = "beamline_W";
        $detector{"style"} = 1;
        print_det(\%configuration, \%detector);

        $zpos = 1290.05;
        %detector = init_det();
        $detector{"name"} = "Cone2";
        $detector{"mother"} = "root";
        $detector{"description"} = "AngelaBrenna Tungsten Tip";
        $detector{"color"} = "884400";
        $detector{"type"} = "Cons";
        $detector{"pos"} = "0*mm 0*mm $zpos*mm";
        $detector{"dimensions"} = "47.62*mm 98.64*mm 47.62*mm 109.76*mm 63.55*mm 0.0*deg 360*deg";
        $detector{"material"} = "beamline_W";
        $detector{"style"} = 1;
        print_det(\%configuration, \%detector);


        $zpos = 2550.0;
        %detector = init_det();
        $detector{"name"} = "TorusConnector";
        $detector{"mother"} = "root";
        $detector{"description"} = "Shield around Shield support before FT on beamline";
        $detector{"color"} = "999966";
        $detector{"type"} = "Cons";
        $detector{"pos"} = "0*mm 0*mm $zpos*mm";
        $detector{"dimensions"} = "97*mm 104*mm 97*mm 104*mm 101.3*mm 0.0*deg 360*deg";
        $detector{"material"} = "G4_Pb";
        $detector{"style"} = 1;
        print_det(\%configuration, \%detector);
    }
    
    else {
        # =========================
        # ELMO / RGH beamline add-on
        # Inseriscilo dentro updated_rghline()
        # Idealmente in un blocco:
        # if ($configuration{"variation"} eq "rghELMO") { ... }
        # =========================

        # ---------------------------------
        # leadInsideApex (mother = fc)
        # ---------------------------------
        %detector = init_det();
        $detector{"name"}        = "leadInsideApex";
        $detector{"mother"}      = "root";
        $detector{"description"} = "lead inside apex";
        $detector{"color"}       = "4499ff";
        $detector{"type"}        = "Tube";
        $detector{"pos"}         = "0*mm 0*mm 6372*mm";
        $detector{"rotation"}    = "0*deg 0*deg 0*deg";
        $detector{"dimensions"}  = "140*mm 190*mm 1000*mm 0*deg 360*deg";
        $detector{"material"}    = "G4_Pb";
        $detector{"style"}       = 1;
        print_det(\%configuration, \%detector);


        # ---------------------------------
        # ElmoTungstenCone
        # ---------------------------------
        %detector = init_det();
        $detector{"name"}        = "ElmoTungstenCone";
        $detector{"mother"}      = "root";
        $detector{"description"} = "Tungsten moller shield - ELMO configuration";
        $detector{"color"}       = "dd8648";
        $detector{"type"}        = "Polycone";
        $detector{"pos"}         = "0*mm 0*mm 0*mm";
        $detector{"rotation"}    = "0*deg 0*deg 0*deg";
        $detector{"dimensions"}  =
            "0.0*deg 360*deg 4*counts "
        . "38.1*mm 38.1*mm 47.62*mm 47.62*mm "
        . "53.28*mm 97.3744404172839*mm 97.3744404172839*mm 105.78*mm "
        . "553.33*mm 1249.4*mm 1249.4*mm 1351*mm";
        $detector{"material"}    = "beamline_W";
        $detector{"style"}       = 1;
        print_det(\%configuration, \%detector);


        # ---------------------------------
        # ElmoWShield
        # ---------------------------------
        %detector = init_det();
        $detector{"name"}        = "ElmoWShield";
        $detector{"mother"}      = "root";
        $detector{"description"} = "Tungsten Shield - ELMO configuration";
        $detector{"color"}       = "dd8648";
        $detector{"type"}        = "Polycone";
        $detector{"pos"}         = "0*mm 0*mm 0*mm";
        $detector{"rotation"}    = "0*deg 0*deg 0*deg";
        $detector{"dimensions"}  =
            "0.0*deg 360*deg 11*counts "
        . "109.54*mm 109.54*mm 109.54*mm 109.54*mm 109.54*mm 100*mm 100*mm 69.85*mm 69.85*mm 95.25*mm 95.25*mm "
        . "109.54*mm 135.5*mm 140*mm 140*mm 170*mm 170*mm 157.88*mm 157.88*mm 132*mm 132*mm 132*mm "
        . "1480.47*mm 1807.53*mm 1807.53*mm 2268*mm 2271.91*mm 2289.90*mm 2321.97*mm 2321.97*mm 2390.47*mm 2390.47*mm 2749.24*mm";
        $detector{"material"}    = "beamline_W";
        $detector{"style"}       = 1;
        print_det(\%configuration, \%detector);


        # ---------------------------------
        # ElmoPbCylinder1
        # ---------------------------------
        %detector = init_det();
        $detector{"name"}        = "ElmoPbCylinder1";
        $detector{"mother"}      = "root";
        $detector{"description"} = "Lead Cylinder 1 - ELMO configuration";
        $detector{"color"}       = "999966";
        $detector{"type"}        = "Polycone";
        $detector{"pos"}         = "0*mm 0*mm 0*mm";
        $detector{"rotation"}    = "0*deg 0*deg 0*deg";
        $detector{"dimensions"}  =
            "0.0*deg 360*deg 2*counts "
        . "47.62*mm 47.62*mm "
        . "100.77*mm 100.77*mm "
        . "1357.34*mm 1802.70*mm";
        $detector{"material"}    = "G4_Pb";
        $detector{"style"}       = 1;
        print_det(\%configuration, \%detector);


        # ---------------------------------
        # ElmoPbCylinder2
        # ---------------------------------
        %detector = init_det();
        $detector{"name"}        = "ElmoPbCylinder2";
        $detector{"mother"}      = "root";
        $detector{"description"} = "Lead Cylinder 2 - ELMO configuration";
        $detector{"color"}       = "999966";
        $detector{"type"}        = "Polycone";
        $detector{"pos"}         = "0*mm 0*mm 0*mm";
        $detector{"rotation"}    = "0*deg 0*deg 0*deg";
        $detector{"dimensions"}  =
            "0.0*deg 360*deg 2*counts "
        . "47.62*mm 47.62*mm "
        . "100.77*mm 100.77*mm "
        . "1809.05*mm 2240.85*mm";
        $detector{"material"}    = "G4_Pb";
        $detector{"style"}       = 1;
        print_det(\%configuration, \%detector);


        # ---------------------------------
        # ElmoWCylinder1
        # ---------------------------------
        %detector = init_det();
        $detector{"name"}        = "ElmoWCylinder1";
        $detector{"mother"}      = "root";
        $detector{"description"} = "Tungsten Cylinder 1 - ELMO configuration";
        $detector{"color"}       = "999966";
        $detector{"type"}        = "Polycone";
        $detector{"pos"}         = "0*mm 0*mm 0*mm";
        $detector{"rotation"}    = "0*deg 0*deg 0*deg";
        $detector{"dimensions"}  =
            "0.0*deg 360*deg 2*counts "
        . "100.78*mm 100.78*mm "
        . "105.77*mm 105.77*mm "
        . "1357.35*mm 1802.71*mm";
        $detector{"material"}    = "beamline_W";
        $detector{"style"}       = 1;
        print_det(\%configuration, \%detector);


        # ---------------------------------
        # ElmoWCylinder2
        # ---------------------------------
        %detector = init_det();
        $detector{"name"}        = "ElmoWCylinder2";
        $detector{"mother"}      = "root";
        $detector{"description"} = "Tungsten Cylinder 2 - ELMO configuration";
        $detector{"color"}       = "999966";
        $detector{"type"}        = "Polycone";
        $detector{"pos"}         = "0*mm 0*mm 0*mm";
        $detector{"rotation"}    = "0*deg 0*deg 0*deg";
        $detector{"dimensions"}  =
            "0.0*deg 360*deg 2*counts "
        . "100.78*mm 100.78*mm "
        . "105.77*mm 105.77*mm "
        . "1809.06*mm 2240.85*mm";
        $detector{"material"}    = "beamline_W";
        $detector{"style"}       = 1;
        print_det(\%configuration, \%detector);


        # ---------------------------------
        # ElmoSteelCase
        # ---------------------------------
        %detector = init_det();
        $detector{"name"}        = "ElmoSteelCase";
        $detector{"mother"}      = "root";
        $detector{"description"} = "Steel Case - ELMO configuration";
        $detector{"color"}       = "666666";
        $detector{"type"}        = "Polycone";
        $detector{"pos"}         = "0*mm 0*mm 0*mm";
        $detector{"rotation"}    = "0*deg 0*deg 0*deg";
        $detector{"dimensions"}  =
            "0.0*deg 360*deg 2*counts "
        . "105.78*mm 105.78*mm "
        . "109.54*mm 109.54*mm "
        . "1352.35*mm 2268.36*mm";
        $detector{"material"}    = "G4_STAINLESS-STEEL";
        $detector{"style"}       = 1;
        print_det(\%configuration, \%detector);


        # ---------------------------------
        # ElmoSupportPipe
        # ---------------------------------
        %detector = init_det();
        $detector{"name"}        = "ElmoSupportPipe";
        $detector{"mother"}      = "root";
        $detector{"description"} = "Steel support pipe - ELMO configuration";
        $detector{"color"}       = "669966";
        $detector{"type"}        = "Polycone";
        $detector{"pos"}         = "0*mm 0*mm 0*mm";
        $detector{"rotation"}    = "0*deg 0*deg 0*deg";
        $detector{"dimensions"}  =
            "0.0*deg 360*deg 4*counts "
        . "38.1*mm 38.1*mm 38.1*mm 38.1*mm "
        . "47.62*mm 47.62*mm 105.78*mm 105.78*mm "
        . "1249.39*mm 2240.86*mm 2240.86*mm 2268.35*mm";
        $detector{"material"}    = "G4_STAINLESS-STEEL";
        $detector{"style"}       = 1;
        print_det(\%configuration, \%detector);
    }

    # UPSTREAM VACUUM PIPE
    my $nplanes = 4;
    my @rmin = (48.350, 48.350, 20.001, 20.001);
    my @rmax = (50, 50, 21.650, 21.650);
    my @z_upstream = (-1204.5, -311.5, -242.5, -239.5);

    %detector = init_det();
    $detector{"name"} = "upstreamVacuumPipe";
    $detector{"mother"} = "root";
    $detector{"description"} = "combined vacuum pipe";
    $detector{"color"} = "aaffff";
    $detector{"type"} = "Polycone";

    my $dimen = "0.0*deg 360*deg $nplanes*counts";

    for (my $i = 0; $i < $nplanes; $i++) { $dimen .= " $rmin[$i]*mm"; }
    for (my $i = 0; $i < $nplanes; $i++) { $dimen .= " $rmax[$i]*mm"; }
    for (my $i = 0; $i < $nplanes; $i++) { $dimen .= " $z_upstream[$i]*mm"; }

    $detector{"dimensions"} = $dimen;
    $detector{"material"} = "G4_STAINLESS-STEEL";
    $detector{"style"} = 1;

    print_det(\%configuration, \%detector);


    # inside
    my @iradius_vac = (0.0, 0.0, 0.0, 0.0);
    my @oradius_vac = (48.349, 48.349, 20.00, 20.00);

    %detector = init_det();
    $detector{"name"} = "upstreamVacuumInPipe";
    $detector{"mother"} = "upstreamVacuumPipe";
    $detector{"description"} = "vacuum inside upstreamVacuumPipe";
    $detector{"color"} = "aaffff";
    $detector{"type"} = "Polycone";

    $dimen = "0.0*deg 360*deg $nplanes*counts";
    for (my $i = 0; $i < $nplanes; $i++) { $dimen .= " $iradius_vac[$i]*mm"; }
    for (my $i = 0; $i < $nplanes; $i++) { $dimen .= " $oradius_vac[$i]*mm"; }
    for (my $i = 0; $i < $nplanes; $i++) { $dimen .= " $z_upstream[$i]*mm"; }

    $detector{"dimensions"} = $dimen;
    $detector{"material"} = "G4_Galactic";
    $detector{"style"} = 1;

    print_det(\%configuration, \%detector);


}