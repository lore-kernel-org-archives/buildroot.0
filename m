From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Apr 2014 22:22:21 +0200
Subject: [Buildroot] [PATCH 0/6] Misc graphs enhancements (branch
 yem/graphs)
In-Reply-To: <20140414221513.43cf4a37@skate>
References: <cover.1397421554.git.yann.morin.1998@free.fr>
 <20140414221513.43cf4a37@skate>
Message-ID: <20140414202221.GC3255@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-04-14 22:15 +0200, Thomas Petazzoni spake thusly:
> On Sun, 13 Apr 2014 22:42:37 +0200, Yann E. MORIN wrote:
> 
> > Yann E. MORIN (6):
> >       Makefile: rename non-user-facing variable
> >       support/graph-depends: use argparse to parse argv[]
> >       support/graph-depends: add option to limit the depth of the graph
> >       manual: document BR2_GRAPH_DEPTH
> >       support/graph-depends: don't show toolchain dependency for all packages
> >       graphs: make graphs with lots of packages nicer to look at
> 
> Applied, thanks. In the last patch, I've removed excessive spaces in
> the expression:
> 
> 	max( ( ( n_pkgs + 10 ) / 48 , 2) )

Yes, that's my default formatting style, which I use since I find it
more readable. I forgot to re-hash it to Buildroot's style.

Thanks for fixing.

> If you have other fixes to do (such as things suggested by Samuel),
> please send followup patches as appropriate.

Yep, doing so right now! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
