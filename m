From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Sep 2020 10:10:31 +0200
Subject: [Buildroot] [PATCH v4 1/2] support/scripts/pycompile: fix .pyc
 original source file paths
In-Reply-To: <20200912114420.mm4qyzw6jbncuiaw@6wind.com>
References: <20200904112908.21686-1-julien.floret@6wind.com>
 <20200910083252.7102-1-robin.jarry@6wind.com>
 <20200910083252.7102-2-robin.jarry@6wind.com>
 <20200911211543.GB10548@scaer>
 <20200912114420.mm4qyzw6jbncuiaw@6wind.com>
Message-ID: <20200913081031.GK10548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robin, All,

On 2020-09-12 13:44 +0200, Robin Jarry spake thusly:
> 2020-09-11, Yann E. MORIN:
[--SNIP--]
> > Still, having to poke into the internals sounds a bit too invasive to
> > me, especially as those internals are version-specific (as your
> > coditional code demonstrates).
> Yes that is not very pretty and it will certainly be a burden to carry
> in the long run. I made the effort to implement this so that the
> previous incremental build feature was preserved.

Yes, I understand why you did that, and that's good. :-)

[--SNIP--]
> I agree, byte compiling python code is very fast and even if every
> python package is selected, the time it takes to compile all .py files
> will be completely negligible compared to the full duration of the
> build. The --force option could be removed in my opinion.

I agree, and I'm going to do while applying.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
