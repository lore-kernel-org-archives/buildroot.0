From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 31 Oct 2012 00:44:01 +0100
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <201210310035.38831.yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <50905E98.3080207@mind.be> <201210310035.38831.yann.morin.1998@free.fr>
Message-ID: <201210310044.01310.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Wednesday 31 October 2012 Yann E. MORIN wrote:
> On Wednesday 31 October 2012 Arnout Vandecappelle wrote:
[--SNIP--]
> >   There is still an alternative: patch Kconfig to "properly" handle
> > select/depend transitivity.  I.e., when a symbol selects another symbol,
> > this implies that all dependencies of the other symbol are inherited.  Did
> > anyone ever investigate the feasibility of such an feature?
[--SNIP--]
> If it were to be the case, then the change should go upstream (eg. the
> Linux kernel) for review first, and then we should lobby for it to be
> included there, before we should even try to use it.

Let me also add this:

This is a change is the kconfig semantics, and will probably be a little
bit difficult to make it accepted upstream, unless the solution is also
usefull for the Linux kernel, which has gone to great lengths to avoid
this very situation for many years now.

So, I would not count in such a change to be in a futur kernel in the
foreseeable futur.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
