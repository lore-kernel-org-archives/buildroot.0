From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jun 2011 10:38:44 +0200
Subject: [Buildroot] adding libgphoto2
In-Reply-To: <4DE33733.6090305@pender.dnsalias.net>
References: <4DE33733.6090305@pender.dnsalias.net>
Message-ID: <20110604103844.7cb3a129@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 May 2011 23:20:35 -0700
Niall Parker <stuff@pender.dnsalias.net> wrote:

> I've been using buildroot 2011.02 and was trying to libgphoto2 and
> was following the howto in the docs (also copying the libusb
> Config.in and .mk with tweaks). Unfortunately it wasn't a trivial
> task and it is complaining it needs libltdl ...
> 
> > checking dynamic linker characteristics... GNU/Linux ld.so
> > checking how to hardcode library paths into programs... immediate
> > checking ltdl.h usability... no
> > checking ltdl.h presence... no
> > checking for ltdl.h... no
> > checking that we can compile and link with libltdl... no
> > configure: error: cannot compile and link against libltdl
> > libgphoto2 requires libltdl (the libtool dl* library),
> > but cannot compile and link against it.
> > Aborting.
> 
> I have enabled libtool in the package selection but evidently the 
> autoconf isn't finding it. Any suggestions on where to start ?

Can you share the current status of your patch, so that we can try to
help you starting from where you are ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
