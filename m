From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:15:13 +0200
Subject: [Buildroot] [PATCH 0/6] Misc graphs enhancements (branch
 yem/graphs)
In-Reply-To: <cover.1397421554.git.yann.morin.1998@free.fr>
References: <cover.1397421554.git.yann.morin.1998@free.fr>
Message-ID: <20140414221513.43cf4a37@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 13 Apr 2014 22:42:37 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (6):
>       Makefile: rename non-user-facing variable
>       support/graph-depends: use argparse to parse argv[]
>       support/graph-depends: add option to limit the depth of the graph
>       manual: document BR2_GRAPH_DEPTH
>       support/graph-depends: don't show toolchain dependency for all packages
>       graphs: make graphs with lots of packages nicer to look at

Applied, thanks. In the last patch, I've removed excessive spaces in
the expression:

	max( ( ( n_pkgs + 10 ) / 48 , 2) )

If you have other fixes to do (such as things suggested by Samuel),
please send followup patches as appropriate.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
