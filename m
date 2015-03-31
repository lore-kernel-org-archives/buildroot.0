From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Apr 2015 00:20:29 +0200
Subject: [Buildroot] [PATCH 0/4 v2] misc graph-depends enhancements
 (branch yem/graph-depends)
In-Reply-To: <20150401000203.0811afe2@free-electrons.com>
References: <cover.1427235377.git.yann.morin.1998@free.fr>
 <20150401000203.0811afe2@free-electrons.com>
Message-ID: <20150331222029.GI3912@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-01 00:02 +0200, Thomas Petazzoni spake thusly:
> On Tue, 24 Mar 2015 23:16:47 +0100, Yann E. MORIN wrote:
> > This series introduces a few enhancements to graph-depends, with two new
> > options:
> >   - --stop-on/-s PKG: to stop graphing on package PKG;
> >   - --exclude/-x PKG: like --stop-on, but also omit PKG from the graph.
[--SNIP--]
> One thing that bothered me a bit is that --stop-on supports the keyword
> 'virtual', but not --exclude.

Right, I'll fix that.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
