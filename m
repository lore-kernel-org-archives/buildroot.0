From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Aug 2014 13:58:22 +0200
Subject: [Buildroot] [PATCH] package/xbmc: Bump version to 13.2rc1
In-Reply-To: <20140813092518.4d70cd10@free-electrons.com>
References: <1407906206-7513-1-git-send-email-bernd.kuhls@t-online.de>
 <20140813092518.4d70cd10@free-electrons.com>
Message-ID: <20140813115822.GC3939@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-08-13 09:25 +0200, Thomas Petazzoni spake thusly:
> On Wed, 13 Aug 2014 07:03:26 +0200, Bernd Kuhls wrote:
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> >  package/xbmc/xbmc.mk |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> > index a7c8080..eaa21c9 100644
> > --- a/package/xbmc/xbmc.mk
> > +++ b/package/xbmc/xbmc.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -XBMC_VERSION = 13.2b3-Gotham
> > +XBMC_VERSION = 13.2rc1-Gotham
> >  XBMC_SOURCE = $(XBMC_VERSION).tar.gz
> >  XBMC_SITE = https://github.com/xbmc/xbmc/archive
> >  XBMC_LICENSE = GPLv2
> 
> If you commit this, then I suggest it goes to 'master' and not 'next'.
> While we normally merge version bumps in 'next' at this point, this
> version bump is a bump from a "beta" version to a "release candidate"
> version, so it should normally bring more stability/fixes to XBMC.

Yes, please apply this to master.

> Bernd: it would have been good to have made this explicit in the commit
> log.

But in the long run, I'd really appreciate if we did not carry those
intermediate alpha/beta/rc versions, and stick with stable ones. For
XBMC, as well as for any other package.

There can be reasons to switch to a alpha/beta/rc version of specific
packages (like, it has been released years ago, and there's no stable,
or whatever), but certainly not in this case.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
