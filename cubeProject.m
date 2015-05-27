function p=cubeProject(filename)

if nargin < 1
    filename = '/Users/drew/projects/CVMP/CubicProjection/forest1.jpg';
end

command = ['unset DYLD_FRAMEWORK_PATH DYLD_LIBRARY_PATH; java -jar /Users/drew/projects/CVMP/CubicProjection/EquirectangularToCubic/EquirectangularToCubic.jar ',filename];

[status,cmdout] = system(command)

if status > 0
    return;
end

[pathstr,name,ext] = fileparts(filename);


parts = ['u','d','l','f','r','b'];

W = [];
for i = parts
    imName = [pathstr, '/', 'cubic_', name, '/', name, '_', i, ext];
    A = imread(imName);
    W = [W A];
end

imwrite(W, [pathstr '/cubic_' name '/cubicCombined' ext]);