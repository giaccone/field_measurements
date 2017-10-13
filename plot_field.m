clear variables, close all

% load data
data = load('data_set.txt');
X = data(:,1);
Y = data(:,2);
Z = data(:,3);
Bx = complex(data(:,4), data(:,7));
By = complex(data(:,5), data(:,8));
Bz = complex(data(:,6), data(:,9));

% prepare data
x = unique(X);
nx = length(unique(X));
ny = length(unique(Y));
nz = length(unique(Z));
X = reshape(X, ny, nx, nz);
Y = reshape(Y, ny, nx, nz);
Z = reshape(Z, ny, nx, nz);
Bx = reshape(Bx, ny, nx, nz);
By = reshape(By, ny, nx, nz);
Bz = reshape(Bz, ny, nx, nz);

% evaluate amplitude
Bmod = sqrt(abs(Bx).^2 + abs(By).^2 + abs(Bz).^2);

% plot all planes
xslice = [min(X(:)), max(X(:))];
yslice = [min(Y(:)), max(Y(:))];
zslice = [min(Z(:)), max(Z(:))];
figure, set(gcf, 'color', [1 1 1])
slice(X,Y,Z,Bmod * 1e6,xslice,yslice, zslice)
set(gca, 'fontsize', 16)
shading interp
axis equal
xlabel('x axis (m)','fontsize',16)
ylabel('y axis (m)','fontsize',16)
zlabel('z axis (m)','fontsize',16)
cb = colorbar;
set(get(cb,'title'),'string','(\muT)')

