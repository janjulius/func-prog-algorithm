using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace impr_bfs
{
    class Program
    {
        //https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Breadth-first_tree.svg/260px-Breadth-first_tree.svg.png
        private static int[] vertices = new[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        private static Tuple<int, int>[] edges = new Tuple<int, int>[]
        {
            Tuple.Create(1, 2),
            Tuple.Create(1, 3),
            Tuple.Create(1, 4),

            Tuple.Create(2, 5),
            Tuple.Create(2, 6),

            Tuple.Create(4, 7),
            Tuple.Create(4, 8),

            Tuple.Create(5, 9),
            Tuple.Create(5, 10),

            Tuple.Create(7, 11),
            Tuple.Create(7, 12),

        };

        static void Main(string[] args)
        {
            Console.WriteLine("BFS algorithm in C#\n" +
                $"Possible entries: { string.Join(", ", vertices)} ");

            Console.WriteLine("Source node: ");
            int src = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Desination node: ");
            int dest = Convert.ToInt32(Console.ReadLine());

            List<int> shortestPath = new BfsHelper().FindShortestPathBfs(src, dest, vertices, edges);

            Console.WriteLine("Result: " + string.Join(", ", vertices));
          
            Console.ReadKey();
        }
    }
}
