From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jan 2014 19:08:29 +0100
Subject: [Buildroot] [git commit] Makefile: expose 'graph-depends' to
 generate a graph of the dependency tree
In-Reply-To: <20140107083723.2cc506c5@skate>
References: <20131229111620.90FC09C227@busybox.osuosl.org>
 <20140107083723.2cc506c5@skate>
Message-ID: <20140107180829.GA3713@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-01-07 08:37 +0800, Thomas Petazzoni spake thusly:
> On Sun, 29 Dec 2013 12:13:19 +0100, Thomas Petazzoni wrote:
> 
> > Generate the graph of the complete dependency tree by calling:
> >     make graph-depends
> > 
> > It's also possible to generate the graph-depends for a single package:
> >     make PKG-graph-depends
> 
> I just tested this in an out-of-tree situation... and it doesn't work.
> It generates the dependency graph of the configuration that is in the
> Buildroot source tree (I happened to have one) and not the one of the
> Buildroot build tree.

It is evven broken when there is no configuration in the Buildroot
source tree.

I'll see what I can do...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
