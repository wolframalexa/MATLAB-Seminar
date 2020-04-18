classdef Flower
    % stores measurements related to one flower
    properties
        petalWidth;
        petalLength;
        sepalWidth;
        sepalLength;
        species;
    end

    methods
        function obj = Flower(a,b,c,d,chars)
            obj.petalWidth = d;
            obj.petalLength = c;
            obj.sepalWidth = b;
            obj.sepalLength = a;
            obj.species = chars;
        end
    
        function out = getSLength(obj)
            % returns sepal length
            out = obj.sepalLength;
        end
        
        function report(obj)
            % reports details about a flower
            fprintf("The length and the width of its sepal are %d cm and %d cm respectively, while " + ...
                "the length and the width of its petal are %d cm and %d cm respectively. It belongs to the %s species.", ...
                obj.sepalLength, obj.sepalWidth, obj.petalLength, obj.petalWidth, obj.species)
        end
    end
end
