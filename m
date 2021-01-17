From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 17 Jan 2021 22:08:37 +0100
Subject: [Buildroot] [PATCH] package/ipmitool: set IPMITOOL_CPE_ID_VALID
In-Reply-To: <20210117161947.GS2375@scaer>
References: <20210117143329.27231-1-heiko.thiery@gmail.com>
 <20210117161947.GS2375@scaer>
Message-ID: <CAEyMn7apJavtAERyYYkqPe+dy38e37c4d1c9im-hKuDCfn91aQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am So., 17. Jan. 2021 um 17:19 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Heiko, All,
>
> On 2021-01-17 15:33 +0100, Heiko Thiery spake thusly:
> > cpe:2.3:a:ipmitool_project:ipmitool is a valid CPE identifier for this
> > package:
> >
> > https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=ipmitool
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >  package/ipmitool/ipmitool.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
> > index 123dd274f4..facd97a0b8 100644
> > --- a/package/ipmitool/ipmitool.mk
> > +++ b/package/ipmitool/ipmitool.mk
> > @@ -9,6 +9,7 @@ IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
> >  IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPMITOOL_VERSION)
> >  IPMITOOL_LICENSE = BSD-3-Clause
> >  IPMITOOL_LICENSE_FILES = COPYING
> > +IPMITOOL_CPE_ID_VENDOR = ipmitool_project
>
> This is the default value when _CPE_ID_VALID is set to YES, so I
> switched to that.

Oh ok .. I did misunderstand that. Now it is clear to me.

> Also, by the looksof the commit log, it looks like
> that's what you indeed wanted to do, hopefully... ;-)

By chance I copy/paste the right commit message from another commit
;-/ So you're right commit log was right .. changes weren't.
Thank you for checking that.

> Applied to master, thanks.

Thank you.

-- 
Heiko
