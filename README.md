# Parametric LG Stove Knob Replacement

A durable, customizable 3D printed replacement for fragile factory LG oven and stove knobs. 

Factory appliance knobs often break at the D-shaft socket and are expensive to replace. This parametric OpenSCAD design allows you to generate a custom replacement block that mounts inside the factory knob shell. It has been specifically optimized for mechanical strength to prevent the new socket from snapping or stripping under the torque of stiff oven dials.

## Included Files
* **`.scad`**: The raw parametric OpenSCAD script. You can adjust the D-shaft diameter, post clearance, and screw spacing to adapt this to other appliances.
* **`.stl`**: The default rendered model (32mm screw spacing, 6mm hole diameter, 29x13x22.5mm block, 9mm post clearance).
* **`.3mf`**: Bambu Studio project file containing the optimized slice settings and dual-material support configuration used for testing.

## Crucial Print Settings
Do **not** print this part standing upright. If the layer lines are parallel to the D-shaft, the twisting force of the stove dial will split the socket along the layer lines. 

To guarantee the part survives long-term use, follow these slicing parameters:

* **Orientation:** Lay the block completely flat on its side. This forces the layer lines to run longitudinally down the column, giving it maximum resistance against shear force.
* **Material:** **ABS, ASA, or PC**. Do not use PLA (it is too brittle) or PETG (it is prone to creep and will eventually round out the socket). 
* **Wall Loops:** **6 or 7**. The torque is concentrated on the inner walls of the socket. High wall counts ensure the D-shaft is surrounded by solid, continuous perimeters.
* **Infill:** 100% (or very high density).
* **Supports:** Normal (Auto) supports are required for the floating side flanges.

### Advanced Dual-Material Supports (Optional)
If you are printing with ABS on a multi-material system (like the Bambu Lab AMS), you can achieve a flawless underside on the floating flanges by using PETG as a support interface:
1. Set the **Support/Raft Interface** to PETG.
2. Leave the **Support Base** as ABS.
3. Set the **Top Z distance** to `0 mm`. Because ABS and PETG do not chemically bond, the PETG interface will act as a non-stick layer and snap off completely clean. Ensure your flushing volumes are set high enough (e.g., 600+) to prevent cross-contamination in the nozzle.
