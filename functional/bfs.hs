import Data.Time
data Vertex = Vertex { vertexLabel :: [Char], vertexNeighbors :: [[Char]] } deriving (Show)

data Graph = Graph [Vertex] deriving (Show)

vertexInVertexes :: Vertex -> [Vertex] -> Bool
vertexInVertexes _ [] = False
vertexInVertexes Vertex {vertexLabel = label} (x:y) = foldl (\ acc x -> vertexLabel x == label || acc) False (x:y)

graphVertexes :: Graph -> [[Char]] -> [Vertex]
graphVertexes (Graph []) _ = []
graphVertexes (Graph (x:y)) [] = x : y
graphVertexes (Graph (x:y)) keys = filter (\ z -> vertexLabel z `elem` keys) (x:y)

bfs :: Graph -> Graph -> [Vertex] -> [Vertex] -> Graph
bfs (Graph []) _ _ _ = Graph []
bfs _ outGraph [] _ = outGraph
bfs (Graph (a:b)) (Graph (c:d)) (e:f) (g:h) = bfs inGraph outGraph queue seen'
    where inGraph = Graph (a:b)
          eLabel = vertexLabel e
          eNeighbors = vertexNeighbors e
          eVertexNeighbors = graphVertexes inGraph eNeighbors
          seen = g : h
          filteredNeighbors = filterVertexNeighbors seen eVertexNeighbors
          enqueue = filteredNeighbors
          outGraph = Graph $ (c:d) ++ enqueue
          queue = f ++ enqueue
          seen' = seen ++ enqueue

filterVertexNeighbors :: [Vertex] -> [Vertex] -> [Vertex]
filterVertexNeighbors _ [] = []
filterVertexNeighbors [] _ = []
filterVertexNeighbors s vn = filter (\ x -> not $ vertexInVertexes x s) vn

printGraph :: Graph -> IO ()
printGraph (Graph []) = putStrLn ""
printGraph (Graph (x:y)) = do
  print x
  printGraph (Graph y)
  return ()


main :: IO ()
main = do
  start <- getCurrentTime
  putStrLn "Bfs in Haskell"
  let inGraph = Graph [
                  Vertex "1" ["2", "3", "4"],
                 Vertex "2" ["5", "6"],
                 Vertex "3" ["1"],
                 Vertex "4" ["7", "8"],
                 Vertex "5" ["9", "10"],
                 Vertex "6" ["2"],
                 Vertex "7" ["11","12"], 
                 Vertex "8" ["4"],
                 Vertex "9" ["5"],
                 Vertex "10" ["5"],
                 Vertex "11" ["7"],
                 Vertex "12" ["7"]
                ]

  let queue = graphVertexes inGraph ["1"]
  let outGraph = Graph queue
  let seen = queue
  printGraph $ bfs inGraph outGraph queue seen

  
  stop <- getCurrentTime
  print $ diffUTCTime stop start
  return ()
