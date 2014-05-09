From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 9 May 2014 11:52:24 +0200
Subject: [Buildroot] [PATCH] graphs: add option to remove transitive
 dependencies in dependency graph
In-Reply-To: <1399416267-16009-1-git-send-email-yann.morin.1998@free.fr>
References: <1399416267-16009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140509095224.GB3173@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-05-07 00:44 +0200, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, all the dependencies of a package are drawn on the dependency
> graph, including transitive dependencies (e.g. A->B->C and A->C).
> 
> Very big graphs, with lots of packages with lots of dependencies, the
> dependency graph can be very dense, and transitive dependencies are
> cluttering the graph.
> 
> In some cases, only getting the "build-order" dependencies is enough (e.g.
> to see what impact a package rebuild would have).
> 
> Add a new environment variable to disable drawing transitive dependencies.

I've marked it as Changes Requested in PAtchwork, since I have a cleaner
patch to come soon, with other cleanups in the graph-depends script.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
