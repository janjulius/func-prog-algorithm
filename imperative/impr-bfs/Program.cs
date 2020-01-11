using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace impr_bfs
{
    class Program
    {
        //https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Breadth-first_tree.svg/260px-Breadth-first_tree.svg.png
        private static int[] vertices = new[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

        private static List<Node> edges = new List<Node>()
        {
            new Node(1, 2, 3, 4),
            new Node(2, 5, 6),
            new Node(4, 7, 8),
            new Node(5, 9, 10),
            new Node(7, 11, 12)
        };

        static void Main(string[] args)
        {
            Stopwatch sw = new Stopwatch();
            sw.Start();

            Console.WriteLine("BFS algorithm in C#\n");

            int src = vertices[0];
            Console.WriteLine($"Starting node is {src}");

            List<int> visisted = new BfsHelper().Bfs(src, vertices, edges);

            Console.WriteLine("Result: " + string.Join(", ", visisted));

            sw.Stop();
            Console.WriteLine($"Took: {sw.ElapsedMilliseconds}");

            Console.ReadKey();
        }
    }
}
