From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 May 2017 21:23:46 +0200
Subject: [Buildroot] [PATCH] mpv: fix X11 logic after bump to 0.25.0
In-Reply-To: <87mvannozi.fsf@dell.be.48ers.dk>
References: <1494250371-13487-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87mvannozi.fsf@dell.be.48ers.dk>
Message-ID: <20170508212346.31e4e7d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 08 May 2017 21:10:57 +0200, Peter Korsgaard wrote:

>  > +# Base X11 support. Config.in ensures that if BR2_PACKAGE_XORG7 is
>  > +# enabled, xlib_libX11, xlib_libXext, xlib_libXinerama,
>  > +# xlib_libXrandr, xlib_libXScrnSaver.  
> 
> It sounds like something is missing from this sentence. I've changed it
> to:
> 
> 'if BR2_PACKAGE_XORG7 is enabled, so is xlib_libX11, ..'

Yes, looks good. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
