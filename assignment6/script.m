a=0;
b=3;
tolerance = 10^-5;
level = 1;
level_max = 30;

%clear function persistent storage
clear functions;

%get results
[simpson_result,simpson_function_call_number] = adapt_simpson(@f, a, b, tolerance, level, level_max);
[rtrapezoid_result, rtrapezoid_call_number] = recursive_trapezoid(@f,a,b, tolerance);
[cgaussian_result, cgaussian_call_number] = composite_gaussian(@f,a,b,(16-1)/2);

%print results
fprintf('results for question 1:\n');
fprintf('method\t\t\t\tcalls\tresults\n');
fprintf('================================================================\n');
fprintf('%s\t\t%d\t%d\n', 'recursive trapezoid', rtrapezoid_call_number, rtrapezoid_result);
fprintf('%s\t%d\t%d\n', 'adaptive simpson''s method', simpson_function_call_number, simpson_result);

fprintf('\n');
fprintf('results for question 2:\n');
fprintf('method\t\t\t\tcalls\tresults\t\tdiff with erf(3)\n');
fprintf('================================================================\n');
fprintf('%s\t\t%d\t%d\t%d\n', 'recursive trapezoid', rtrapezoid_call_number, rtrapezoid_result, abs(rtrapezoid_result-erf(3)));
fprintf('%s\t%d\t%d\t%d\n', 'adaptive simpson''s method', simpson_function_call_number, simpson_result, abs(simpson_result-erf(3)));
fprintf('%s\t\t%d\t%d\t%d\n', 'composite gaussian', cgaussian_call_number, cgaussian_result, abs(cgaussian_result-erf(3)));


