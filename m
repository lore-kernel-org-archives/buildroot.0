From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 1 Nov 2014 21:51:29 +0100
Subject: [Buildroot] [PATCH v2] xinetd: change download location
In-Reply-To: <20141101190833.GF10189@free.fr>
References: <1414863185-1250-1-git-send-email-kaszak@gmail.com>
 <20141101190833.GF10189@free.fr>
Message-ID: <CABbD_XCgRrpWOsGq0MRZTrJZ+W50wsAuQsX9+dWsuKFPX5LEPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

thanks for the notice, I'll use that.

Best regards,
Karoly

On Sat, Nov 1, 2014 at 8:08 PM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Karoly, All,
>
> On 2014-11-01 18:33 +0100, Karoly Kasza spake thusly:
> > xinetd.org is down, change to github instead.
> > Hash can not be used, the tarball is generated.
> >
> > Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> > ---
> >  package/xinetd/xinetd.mk |    5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
> > index 1fb91b5..0ecc1ad 100644
> > --- a/package/xinetd/xinetd.mk
> > +++ b/package/xinetd/xinetd.mk
> > @@ -4,8 +4,9 @@
> >  #
> >
> ################################################################################
> >
> > -XINETD_VERSION = 2.3.15
> > -XINETD_SITE = http://www.xinetd.org
> > +XINETD_VERSION = 2-3-15
> > +XINETD_SOURCE = xinetd-$(XINETD_VERSION).tar.gz
> > +XINETD_SITE = https://github.com/xinetd-org/xinetd/archive
>
> See the manual on how to use the github helper:
>     http://nightly.buildroot.org/#github-download-url
>
> Regards,
> Yann E. MORIN.
>
> >  XINETD_LICENSE = xinetd license
> >  XINETD_LICENSE_FILES = COPYRIGHT
> >
> > --
> > 1.7.10.4
> >
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>



-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141101/310a3f5e/attachment.html>
