Case_size = "glasses"; // [glasses, sunglasses, xl]
Name = "Jonan";
Label_position = "top"; // [top, bottom, both]
Font = "Arial";
Font_size = 22;


module case() {
    if (Case_size == "glasses") {
        translate([-60, 8, 0]) {
            import("glasses.stl");
        }
    } else if (Case_size == "sunglasses") {
        translate([-64, 6, 0]) {
            import("sunglasses.stl");
        }
    } else {
        translate([-68, 4, 0]) {
            import("xl.stl");
        }
    }
}

module bot_label() {
    translate([0, 0, -0.55]) {
        linear_extrude(1.01) {
            translate([-10, 159, 0]) {
                rotate([0, 180, 90]) {
                    text(Name, size=Font_size, font=Font);
                }
            }
        }
    }
}

module top_label() {
    y_off = 0;
    if (Case_size == "glasses") {
        y_off = 0;
        x_off = 0;
        translate([-55+x_off, 8+y_off, -0.55]) {
            linear_extrude(1.01) {
                translate([-62, 5, 0]) {
                    rotate([0, 180, 270]) {
                        text(Name, size=Font_size, font=Font);
                    }
                }
            }
        }
    } else if (Case_size == "sunglasses") {
        x_off = -8;
        y_off = -4;
        translate([-55+x_off, 8+y_off, -0.55]) {
            linear_extrude(1.01) {
                translate([-62, 5, 0]) {
                    rotate([0, 180, 270]) {
                        text(Name, size=Font_size, font=Font);
                    }
                }
            }
        }
    } else {
        x_off = -16;
        y_off = -8;
        translate([-55+x_off, 8+y_off, -0.55]) {
            linear_extrude(1.01) {
                translate([-62, 5, 0]) {
                    rotate([0, 180, 270]) {
                        text(Name, size=Font_size, font=Font);
                    }
                }
            }
        }
    }
}

module label() {
    if (Label_position == "bottom") {
        bot_label();
    } else if (Label_position == "top") {
        top_label();
    } else {
        bot_label();
        top_label();
    }
}

difference() {
    case();
    label();
}
label();