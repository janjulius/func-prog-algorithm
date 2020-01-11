data Vertex = Vertex {
    number :: Int,
    neighbour :: [Int]
} deriving (Show)

data Graph = Graph [Vertex] deriving (Show)

graphVertexes :: Graph -> [[Int]] -> [Vertex]
graphVertexes (Graph []) _ = []
graphVertexes (Graph (x:y)) [] = x : y
graphVertexes (Graph (x:y)) keys = filter (\ z -> number z `elem` keys) (x:y)


main = do 
    let myGraph = Graph [Vertex 1 [2,3,4]]

    let queue graphVertexes myGraph [1]
      
    let result = Graph queue
    let seen = queue
    return ()

