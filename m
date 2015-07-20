From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 20 Jul 2015 07:58:30 +0000
Subject: [Buildroot] [PATCH] qt: enable Script and WebKit modules for ARC
In-Reply-To: <20150718192015.3676e5a8@free-electrons.com>
References: <1436968037-26800-1-git-send-email-abrodkin@synopsys.com>
 <20150718192015.3676e5a8@free-electrons.com>
Message-ID: <1437379110.4091.5.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, 2015-07-18 at 19:20 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Wed, 15 Jul 2015 16:47:17 +0300, Alexey Brodkin wrote:
> 
> > diff --git a/package/qt/Config.in b/package/qt/Config.in
> > index 306fe1f..cadc784 100644
> > --- a/package/qt/Config.in
> > +++ b/package/qt/Config.in
> > @@ -412,7 +412,8 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
> >  	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazeel || \
> >  		BR2_microblazebe || BR2_mips || BR2_mipsel || \
> >  		(BR2_mips64 || BR2_mips64el) && !BR2_MIPS_NABI32 || BR2_powerpc || \
> > -		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || BR2_x86_64
> > +		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || BR2_x86_64 || \
> > +		BR2_arc
> 
> Alphabetic ordering was not correct (for both), so I've fixed that up
> and applied, thanks!

I'm sorry that you had to rework this but I put ARC in the end consciously.
As an extension to existing arches. But if alphabetical order is preferred
in Buildroot even for things added later I'll keep this in mind for the future.

And thanks a lot for fixing this minor issue.

-Alexey
