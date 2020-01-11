using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace impr_bfs
{
    public class Node
    {
        public int Number { private set; get; }
        public int[] Neighbours { private set; get; }

        public Node(int number, params int[] neighbours)
        {
            Number = number;
            Neighbours = neighbours;
        }
    }
}
