using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace impr_bfs
{
    /// <summary>
    /// The helper class for the bfs algorithm
    /// </summary>
    internal class BfsHelper
    {
        /// <summary>
        /// Breadth first search
        /// </summary>
        /// <param name="src"></param>
        /// <param name="dest"></param>
        /// <param name="vertices"></param>
        /// <param name="edges"></param>
        /// <returns></returns>
        public List<int> Bfs(int src, int[] vertices, Tuple<int, int>[] edges)
        {
            List<int> visited = new List<int>();

            Queue<int> queue = new Queue<int>();

            queue.Enqueue(src);
            visited.Add(src);

            while(queue.Count > 0)
            {
                int deq = queue.Dequeue();

                if (visited.Contains(deq))
                    continue;

                visited.Add(deq);

                int[] adjList = GetAdjecencyList(deq, edges);

                foreach(int n in adjList)
                {
                    if (!visited.Contains(n))
                    {
                        queue.Enqueue(n);
                    }
                }
            }

            return visited;
        }

        /// <summary>
        /// Returns all adjecent nodes to <paramref name="node"/>
        /// </summary>
        /// <param name="node">The node to search for</param>
        /// <param name="edges">The edges to search in</param>
        /// <returns>Array of adjecent nodes</returns>
        public int[] GetAdjecencyList(int node, Tuple<int, int>[] edges)
        {
            List<int> adjNodes = new List<int>();

            for (int i = 0; i < edges.Length; i++)
                if (edges[i].Item1 == node)
                    if (!adjNodes.Contains(edges[i].Item2))
                        adjNodes.Add(edges[i].Item2);

            Console.WriteLine($"node: {node} result: {string.Join(", ", adjNodes)}");
            return adjNodes.ToArray();
        }
    }
}
