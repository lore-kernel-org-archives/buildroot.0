From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 May 2013 21:48:15 +0200
Subject: [Buildroot] [PATCH 0/1] Makefile: add variable print
	capabilities
In-Reply-To: <20130526214445.03abd9d3@skate>
References: <1342724478-21701-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <20120719220825.584bfb03@skate> <20130526194014.GC3380@free.fr>
 <20130526214445.03abd9d3@skate>
Message-ID: <20130526194815.GD3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-05-26 21:44 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Sun, 26 May 2013 21:40:14 +0200, Yann E. MORIN wrote:
> 
> > > Hum, is this really useful? What are the use cases? What do other
> > > thinks about this?
> > 
> > I like the overall idea, but only for printing all variables.
> > It's then possible to grep the result to find the one variable one is
> > interested in.
> > 
> > I've taken that patch in my tree (dropped the per-variable print, and
> > adapted the printvars a bit), and will send a pull request to Peter
> > later tonight.
> 
> I would suggest to not send patches touching the core infrastructure as
> part of a pull request that also has many usually uncontroversial
> package changes/updates.

Yes, it's in a separate branch. I have three branches:
  - fixes
  - features
  - tentative

That one is on the tentative branch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
