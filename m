From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Oct 2013 12:19:09 +0200
Subject: [Buildroot] Suggestions adding new package for next release
In-Reply-To: <CAKB_xO6h-XXVCB5sDEJR_4tu-7tppGcbPqAixmBeQjFokiie4w@mail.gmail.com>
References: <CAKB_xO6h-XXVCB5sDEJR_4tu-7tppGcbPqAixmBeQjFokiie4w@mail.gmail.com>
Message-ID: <20131017121909.5e919a9a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arief setiawan marsis,

On Thu, 17 Oct 2013 17:09:54 +0700, Arief setiawan marsis wrote:
> # Multimedia category
>  - VLC Media player < http://videolan.org/ > , Video player

We have a patch for this one sitting in our patchwork.

>  - Audacious Media player < http://audacious-media-player.org/ >
>  - TIMIDITY < http://timidity.sourceforge.net/ >
> 
> # Development category
>  - IGNSDK < http://ignsdk.web.id/ >
>    description : IGN SDK is a software development kit designed
> specifically for application developers in IGOS Nusantara. But now
> also available for other Linux distros such as Arch Linux, Slackware
> and Debian. You can write native apps in HTML and Javascript with
> IGNSDK
> 
> # Desktop Environment
>  - Manokwari Desktop Environment <
> http://manokwari.blankonlinux.or.id/ > description : GTK+ and HTML5
> Frontend
> 
>  - MATE Desktop Environment < http://mate-desktop.org/ >
>    description : The Traditional Desktop Environment

For the other ones, patches are welcome. That being said, some of those
applications are really desktop-level applications, and I really
believe that Buildroot is not really suited to build desktop-level root
filesystems. If you need a full-featured Desktop Environment, then you
should really use either a package-based build system such as OE or
Yocto, or use a pre-build distro such as Ubuntu or Debian.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
