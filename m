From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Feb 2021 09:03:47 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/libcamera-apps: new package
In-Reply-To: <20210131234844.537ed0c1@gmx.net>
References: <20210129230418.26359-1-ps.report@gmx.net>
 <20210129230418.26359-3-ps.report@gmx.net>
 <20210131232048.1bfc2944@windsurf.home>
 <20210131234844.537ed0c1@gmx.net>
Message-ID: <20210201090347.668500e9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sun, 31 Jan 2021 23:48:44 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> > Loooots of patches. I suppose you submitted them upstream already ?  
> 
> Yes, see [1]...., and more patches to come to fix test-pkg failures...

Great!

> > To be honest, I am wondering if we shouldn't do a "depends on
> > BR2_PACKAGE_LIBCAMERA" to simplify this a bit. Indeed, if you want
> > libcamera-apps, most likely you know you should enable libcamera as
> > well.  
> 
> The experienced buildroot user will do...., but the average RPi user?

Ah, but I now realize this libcamera-apps stuff is from the raspberrypi
project, not from the libcamera project.

Fair enough, my comment was not a very strong one, so I'm fine with a
select of libcamera + propagation of dependencies, as you did.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
