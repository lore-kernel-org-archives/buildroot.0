From: Matthew Weber <matthew.weber@collins.com>
Date: Tue, 20 Apr 2021 16:07:40 -0500
Subject: [Buildroot] [PATCH 13/25] package/libtool: add _CPE_ID_VENDOR
In-Reply-To: <20210420204904.GG298901@scaer>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
 <20210420201146.42858-13-matthew.weber@rockwellcollins.com>
 <20210420204904.GG298901@scaer>
Message-ID: <CANQCQpajobU-njWWnQL9oETJ_8M_GegS09sjhDuQAvFS_Kut9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,


On Tue, Apr 20, 2021 at 3:50 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Matthew, All,
>
> On 2021-04-20 15:11 -0500, Matt Weber spake thusly:
> > cpe:2.3:a:gnu:libtool:2.4.6:* is a valid CPE identifier for this package:
> >
> >  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:libtool:2.4.6
>
>     There are 0 matching records.
>
> However, there are resilts with:
>     https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:libtool
>
> Quid?

Correct, typo on my part.  Drop the version in this description and
the patch is valid.

>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  package/libtool/libtool.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
> > index 10af8cf715..6342e70a39 100644
> > --- a/package/libtool/libtool.mk
> > +++ b/package/libtool/libtool.mk
> > @@ -7,6 +7,7 @@
> >  LIBTOOL_VERSION = 2.4.6
> >  LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
> >  LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
> > +LIBTOOL_CPE_ID_VENDOR = gnu
> >
> >  # For the target variant, we only want to build/install libltdl
> >  LIBTOOL_SUBDIR = libltdl
> > --
> > 2.17.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
