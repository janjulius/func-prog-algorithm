import java.util.*

/**
 * Main method
 */
fun main(args: Array<String>){
    /**
     * The vertices
     */
    val vertices = arrayOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

    /**
     * The pairs
     */
    val pairs = arrayOf(
            1 to 2,
            1 to 3,
            1 to 4,
            2 to 5,
            2 to 6,
            4 to 7,
            4 to 8,
            5 to 9,
            5 to 10,
            7 to 11,
            7 to 12)

    println("Breadth first search in Kotlin\n" +
            "Enter a starting node\n" +
            "Possible entries: ${Arrays.toString(vertices)}")

    println("\nEnter staring node: ")
    val src = readLine()!!.toInt();

    println(bfs(src, vertices, pairs))
}

/**
 * Breadth first search method
 * @param src The source node
 * @param vertices Vertices of this graph
 * @param edges Edges of this graph
 * @return List of visited nodes
 */
fun bfs(src: Int, vertices: Array<Int>, edges: Array<Pair<Int, Int>>) : List<Int> {
    val visited = mutableListOf<Int>()
    val queue: Queue<Int> = ArrayDeque<Int>()

    queue.add(src)
    visited.add(src)

    while(queue.count() > 0){
        val deq = queue.poll()

        if(visited.contains(deq))
            continue

        visited.add(deq)

        val adjList = getAdjList(deq, edges)

        adjList.forEach {
            if (!visited.contains(it))
                queue.offer(it)
        }
    }

    return visited;
}

/**
 * Gets all the adjecent values
 * @param node The node to find the adjecent nodes for
 * @param edges The edges to look in
 */
fun getAdjList(node: Int, edges: Array<Pair<Int, Int>>) : Array<Int> {
    val adjNodes = mutableListOf<Int>()
    edges.forEach {
        if (it.first == node)
            if (!adjNodes.contains(it.second))
                adjNodes.add(it.second)
    }
    return adjNodes.toTypedArray()
}