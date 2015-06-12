From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 12 Jun 2015 08:54:24 +0200 (CEST)
Subject: [Buildroot] [PATCH 02/11 v2] docs/manual: add kernel-module
In-Reply-To: <20150611180635.GC3689@free.fr>
Message-ID: <952449732.1476897.1434092064674.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> > > +13: FOO_MODULE_SUBDIRS = driver/base
> > > +14: FOO_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
> > 
> > ^ This variable is not documented anywhere, you might want to do
> > that...
> 
> Yup, thanks.
> 
> What about:
>     http://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/kernel-modules&id=663ab1ec1c3e5b80eae0bdb355bc0e2e0d58497c
> 
> (toward the end).
> 

Awesome, sounds good to me


> Regards,
> Yann E. MORIN.
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> |  conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
> |               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/
> |  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> |   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> 
