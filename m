From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 May 2013 21:40:14 +0200
Subject: [Buildroot] [PATCH 0/1] Makefile: add variable print
	capabilities
In-Reply-To: <20120719220825.584bfb03@skate>
References: <1342724478-21701-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <20120719220825.584bfb03@skate>
Message-ID: <20130526194014.GC3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Emeric, All,

On 2012-07-19 22:08 +0200, Thomas Petazzoni spake thusly:
> Le Thu, 19 Jul 2012 15:01:17 -0400,
> Emeric Vigier <emeric.vigier@savoirfairelinux.com> a ?crit :
> 
> > I just got started with buildroot yesterday, and like it :-).
> > I am no Makefile expert, then often I turn into wanting to check Makefile variables.
> > This patch adds a capability to do so by issuing:
> > 
> > $ make print-<myvariable>
> > 
> > e.g.
> > 
> > $ make print-DL_DIR
> > DL_DIR = /home/evigier/buildroot/dl
> 
> Hum, is this really useful? What are the use cases? What do other
> thinks about this?

I like the overall idea, but only for printing all variables.
It's then possible to grep the result to find the one variable one is
interested in.

I've taken that patch in my tree (dropped the per-variable print, and
adapted the printvars a bit), and will send a pull request to Peter
later tonight.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
