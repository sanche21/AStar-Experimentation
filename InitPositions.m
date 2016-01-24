function [ Vehicles, Packages, Garage  ] = InitPositions( G, N, K )

    nodeCount = numnodes(G);

    startPoint = randi([1 nodeCount],1,1);
    Vehicles = struct('position', repmat({startPoint}, N, 1));
    %create vehicles

    Packages = struct;
    for i=1:K
        rand1 = startPoint;
        rand2 = startPoint;
        while rand1 == startPoint
            rand1 = randi([1 nodeCount],1,1);
        end
        while rand2 == startPoint || rand2 == rand1
            rand2 = randi([1 nodeCount],1,1);
        end
       Packages(i).startPt =  rand1;
       Packages(i).endPt =  rand2;
    end

    Garage = startPoint;
end

