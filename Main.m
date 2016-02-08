function Main(M, N, K, P, EdgeRemoval, Seed)
    %convert inputs to number values
    if ischar(M)
        M = str2num(M);
    end
    if ischar(N)
        N = str2num(N);
    end
    if ischar(K)
        K = str2num(K);
    end
    if ischar(P)
        P = str2num(P);
    end
    
    %set the random seed value if there is one
    if Seed ~= 0
        rng(Seed)
    end

    if(M < N*2 + 1)
       error('not enough locations for that many packages (M < N*2 + 1)'); 
    end

    G = GridGraphGenerator(M, [1 20], EdgeRemoval);
    [ Vehicles, Packages, GaragePt  ] = InitPositions(G, N, K);
    [Path, Cost, Turns] = AStar( N, Packages, GaragePt, G, M, P )
end
