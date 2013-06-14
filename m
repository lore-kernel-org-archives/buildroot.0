From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Fri, 14 Jun 2013 10:46:05 +0200
Subject: [Buildroot] [PATCH 1/1] New package: libqrencode
In-Reply-To: <20130614082437.GB4312@tarshish>
References: <1371197197-16323-1-git-send-email-phil@zankapfel.net>
 <20130614082437.GB4312@tarshish>
Message-ID: <CAPiYbRJOssi1M6KjqwfrrDXs0uYMvoa2H-WszU=bMjyxj3Q7Xw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14 June 2013 10:24, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Phil,
>
> Thanks for contributing. A couple of comments below.
>
> On Fri, Jun 14, 2013 at 10:06:37AM +0200, Phil Eichinger wrote:
> >
> > Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> > ---
>
> [...]
>
> > diff --git a/package/libqrencode/libqrencode.mk
> > b/package/libqrencode/libqrencode.mk
> > new file mode 100644
> > index 0000000..121fd86
> > --- /dev/null
> > +++ b/package/libqrencode/libqrencode.mk
> > @@ -0,0 +1,20 @@
> > +#############################################################
> > +#
> > +# libqrencode
> > +#
> > +#############################################################
> > +
> > +LIBQRENCODE_VERSION = 3.4.2
> > +LIBQRENCODE_SOURCE = qrencode-$(LIBQRENCODE_VERSION).tar.gz
>
> This the default, you can remove this line.
>

If i remove this line it defaults to libqrencode-3.4.2.tar.gz, but the
actual filename is qrencode-3.4.2.tar.gz


>
> > +LIBQRENCODE_SITE = http://fukuchi.org/works/qrencode
> > +LIBQRENCODE_DEPENDENCIES = libpng
> > +LIBQRENCODE_LICENSE = GPLv2+
>
> The web page and README/COPYING file say the license is LGPLv2.1+.
>

You are absolutely correct, sorry about that, I'll post an updated patch.

cheers, Phil
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130614/bf5bc602/attachment.html>
