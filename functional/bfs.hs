data Vertex = Vertex {
                          vertexLabel :: [Char]
                        , vertexNeighbors :: [[Char]]
                        , vertexDistance :: Int
                        , vertexPredecessor :: [Char]
                      } deriving (Show)

data Graph = Graph [Vertex] deriving (Show)

vertexInVertexes :: Vertex -> [Vertex] -> Bool
vertexInVertexes _ [] = False
vertexInVertexes Vertex {vertexLabel = label} (x:y) = foldl (\ acc x -> vertexLabel x == label || acc) False (x:y)

graphVertexes :: Graph -> [[Char]]-> [Vertex]
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
          dist = vertexDistance e + 1
          seen = g : h
          filteredNeighbors = filterVertexNeighbors seen eVertexNeighbors
          enqueue = updateDistPred filteredNeighbors dist eLabel
          outGraph = Graph $ (c:d) ++ enqueue
          queue = f ++ enqueue
          seen' = seen ++ enqueue

filterVertexNeighbors :: [Vertex] -> [Vertex] -> [Vertex]
filterVertexNeighbors _ [] = []
filterVertexNeighbors [] _ = []
filterVertexNeighbors s vn = filter (\ x -> not $ vertexInVertexes x s) vn

updateDistPred :: [Vertex] -> Int -> [Char] -> [Vertex]
updateDistPred [] _ _ = []
updateDistPred (x:y) dist predLabel = map (\ (Vertex label n _ _) -> Vertex label n dist predLabel) (x:y)

printGraph :: Graph -> IO ()
printGraph (Graph []) = putStrLn ""
printGraph (Graph (x:y)) = do
  print x
  printGraph (Graph y)
  return ()

main :: IO ()
main = do
  let inGraph = Graph [
                  Vertex "a" ["b", "c"          ] 0 ""
                , Vertex "b" ["a", "d", "e"     ] 0 ""
                , Vertex "c" ["a", "d"          ] 0 ""
                , Vertex "d" ["b", "c", "e"     ] 0 ""
                , Vertex "e" ["b", "d", "f", "g"] 0 ""
                , Vertex "f" ["e", "g", "h"     ] 0 ""
                , Vertex "g" ["e", "f", "i"     ] 0 ""
                , Vertex "h" ["f", "i"          ] 0 ""
                , Vertex "i" ["g", "h"          ] 0 ""
                ]
  let queue = graphVertexes inGraph ["e"]
  let outGraph = Graph queue
  let seen = queue
  printGraph $ bfs inGraph outGraph queue seen
  return ()