hrna=h(:,2);
hrna=hrna';

h1rna=h1(:,2);
h1rna=h1rna';

h2rna=h2(:,2);
h2rna=h2rna';

v1rna=v1(:,2);
v1rna=v1rna';

v2rna=v2(:,2);
v2rna=v2rna';

input = [v1rna; v2rna; h1rna; h2rna];
output = hrna;

% plot(network1_outputs);hold on;plot(hrna,'--r');