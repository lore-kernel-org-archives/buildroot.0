From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Jan 2014 21:59:47 +0100
Subject: [Buildroot] [PATCH] Config: default BR2_PACKAGE_OVERRIDE_FILE
 to $(CONFIG_DIR)/local.mk
In-Reply-To: <CAAXf6LUBuatdDGREG1xKXE0XVdjJ067tNfXC+=_-O9g2fTD5OQ@mail.gmail.com>
References: <1391020967-19043-1-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LUBuatdDGREG1xKXE0XVdjJ067tNfXC+=_-O9g2fTD5OQ@mail.gmail.com>
Message-ID: <20140129205947.GB3397@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-01-29 21:45 +0100, Thomas De Schampheleire spake thusly:
> Op 29-jan.-2014 19:43 schreef "Yann E. MORIN" <yann.morin.1998@free.fr>:
> >
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > The current default for BR2_PACKAGE_OVERRIDE_FILE points to:
> >     $(TOPDIR)/local.mk
> >
> > This works well for in-tree builds, but is not very useful for
> > out-of-tree builds, when the Buildroot source tree may be shared for
> > different concurrent builds.
> >
> > Also, it seems to be more sensible to have local.mk alognside
> > the .config file.
> >
> > Hence, change the default for BR2_PACKAGE_OVERRIDE_FILE to point to:
> >     $(CONFIG_DIR)/local.mk
> 
> ... which in the default case equals TOPDIR, right? (Would be nice to
> clarify in the commit message)

Oh, yes. I intended to write that part, but was absorbed by the very
nice fumet of the dinner being cooked at the time I wrote the commit
log.

I plead guilty for having been disturbed by my nostrils, and my stomach!

I'll respin with that added. Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
