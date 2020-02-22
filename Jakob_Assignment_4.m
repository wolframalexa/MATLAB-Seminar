close all; clear all; clc
%%
% Alexa Jakob
% ECE210: MATLAB Seminar, Homework #4, 2/26/2020

%% Function tests (d)

% More elements in each vector than number of vectors
s1 = rand(6,3)+1j*rand(6,3);
g1 = gramSchmidt(s1);
i1 = isOrthonormal(g1);

v1 = rand(1,6) + 1j*rand(1,6);
orthov1 = orthoProj(v1,s1);
iv1 = isOrthonormal(orthov1);
e1 = norm(v1 - orthov1);

% # vectors equal to # elements
s2 = rand(6)+1j*rand(6);
g2 = gramSchmidt(s2);
i2 = isOrthonormal(g2);

v2 = rand(1,6);
orthov2 = orthoProj(v2,s2);
iv2 = isOrthonormal(orthov2);
e2 = norm(v2 - orthov2);

answer = table(e1,e2)
if e1 > e2
    disp('Error 1 is larger than error 2')
  else
    disp('Error 2 is larger than error 1')
end

%% Plotting (e)
%a
x = linspace(0, 2*pi, 100);
y = sin(x);
plot(x,y);
hold on

means = 0:pi/2:2*pi;

% Plot Gaussians on same plot
gaussians = zeros(numel(x),5);
for i=1:numel(means)
    hold on
    gaussian = 1/sqrt(2*pi)*exp(-(x-means(i)).^2);
    plot(x,gaussian)
    gaussians(:,i) = gaussian;
end
title('Sinusoid and Gaussians with different means')
legend('y = sin(x)', '\mu = 0', '\mu = \pi/2', '\mu = \pi', '\mu = 3\pi/2', '\mu = 2\pi')
xlabel('x')
ylabel('y')

%b
basis = gramSchmidt(gaussians);
sin_est = orthoProj(y, basis);

%c
figure
subplot(2,1,1)
plot(x,y)
hold on
plot(x,sin_est)
title('Sine and Estimated Sine')
xlabel('x')
ylabel('y')
legend('Sine', 'Estimated sine')

subplot(2,1,2)
for i=1:5
    hold on
    plot(x,basis(:,i))
end
title('Orthonormal basis functions')
xlabel('x')
ylabel('y')

%% Functions

function out = gramSchmidt(in)
% function takes a matrix of column vectors and performs Gram-Schmidt
% algorithm to generate an orthonormal set
  [i,j] = size(in);
  out = zeros(i,j);
  out(:,1) = in(:,1)/norm(in(:,1));
 
  for k=2:j
      sum = 0;
      for l=1:k-1
        sum = sum + dot(in(:,k),out(:,l))*out(:,1);
      end
      
      psi = in(:,k) - sum;
      phi = psi./norm(psi);
      out(:,k) = phi;
  end
end

function bool = isOrthonormal(in)
% checks if the column vectors of a matrix are orthogonal to each other
  bool = 1;
  [i,j] = size(in);
  
  for l = 1:j
      for k = i+1:j
        if dot(in(:,l),in(:,k)) > eps('single')
            bool = 0;
        end
      end
  end
end

function projection = orthoProj(vector, orthnorm)
% estimate a vector as a linear combination of orthonormal vectors
  [i,j] = size(vector);
  projection = zeros(i,j);
  [m,n] = size(orthnorm);
  
  for l=1:n
      projection = projection + dot(orthnorm(:,l),vector).*orthnorm(:,l);
  end
end