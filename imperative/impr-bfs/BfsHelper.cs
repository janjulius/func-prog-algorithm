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
        public List<int> Bfs(int src, int[] vertices, List<Node> edges)
        {
            List<int> visited = new List<int>();

            Queue<int> queue = new Queue<int>();

            queue.Enqueue(src);

            while(queue.Count > 0)
            {
                int deq = queue.Dequeue();

                visited.Add(deq);

                Node seq = edges.FirstOrDefault(x => x.Number == deq);
                if (seq != null)
                {
                    int[] adjList = seq?.Neighbours;

                    foreach (int n in adjList)
                    {
                        if (!visited.Contains(n))
                        {
                            queue.Enqueue(n);
                        }
                    }
                }
            }

            return visited;
        }
    }
}
