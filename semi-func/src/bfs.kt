import java.util.*;

/**
 * Main method
 */
fun main(args: Array<String>){
    /**
     * The vertices
     */
    val vertices = arrayOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

    val nodes = arrayOf(node(1, intArrayOf(2,3,4)), node(2, intArrayOf(5, 6)), node(4, intArrayOf(7, 8)), node(5, intArrayOf(9, 10)), node(7, intArrayOf(11, 12)));

    val startMillis = System.currentTimeMillis();

    println("Breadth first search in Kotlin");

    val src = vertices[0];

    val result = bfs(src, vertices, nodes);

    println("result: " + result.joinToString(postfix = ","))
    println("Took: " + (System.currentTimeMillis() - startMillis).toString());
}

/**
 * Breadth first search method
 * @param src The source node
 * @param vertices Vertices of this graph
 * @param edges Edges of this graph
 * @return List of visited nodes
 */
fun bfs(src: Int, vertices: Array<Int>, edges: Array<node>) : List<Int> {
    val visited = mutableListOf<Int>()
    val queue: ArrayDeque<Int> = ArrayDeque<Int>()

    queue.add(src)

    while(!queue.isEmpty()){
        val deq = queue.poll()

        visited.add(deq)

        val node = edges.filter { it.number == deq }.firstOrNull();

        if(node != null) {
            node.neighbours.forEach {
                    if (!visited.contains(it))
                        queue.add(it)
            }
        }
    }

    return visited;
}