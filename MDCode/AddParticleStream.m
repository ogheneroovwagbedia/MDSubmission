function [ output_args ] = AddParticleStream(num, x0, y0, angleUp, angleDown, Type, Ep, Seper)
global AtomSpacing x y AtomType Vx Vy Mass0 Mass1 nAtoms

if Type == 0
    Mass = Mass0;
else
    Mass = Mass1;
end


r = (angleUp-angleDown).*rand(num+1,1) + angleDown;
for p = 0:num - 1
    
    nAtoms = nAtoms + 1;
    x(nAtoms) = x0 * AtomSpacing - Seper * p * AtomSpacing * cosd(r(p+1));
    y(nAtoms) = y0 * AtomSpacing - Seper * p * AtomSpacing * sind(r(p+1));
    AtomType(nAtoms) = Type;
end

V = sqrt(2 * Ep / Mass);

for p = 1:num
    Vx(nAtoms - num + p) = V * cosd(r(p+1));
    Vy(nAtoms - num + p) = V * sind(r(p+1));
end

end