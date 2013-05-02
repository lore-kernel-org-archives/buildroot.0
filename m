From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 May 2013 11:59:22 +0200
Subject: [Buildroot] [PATCH v2 3/3] configs: add defconfig for Atmel
 AT91SAM9260-EK Nand Flash Boot
In-Reply-To: <CAHkwnC9rJ+hnqeb+NGGKB-zbzybFtU6_QHHf0Pxp50qAJv1azA@mail.gmail.com>
References: <1366184503-16875-1-git-send-email-fabio.porcedda@gmail.com>
 <1366184503-16875-4-git-send-email-fabio.porcedda@gmail.com>
 <20130501231452.2151618f@skate>
 <CAHkwnC9rJ+hnqeb+NGGKB-zbzybFtU6_QHHf0Pxp50qAJv1azA@mail.gmail.com>
Message-ID: <20130502115922.4b82e8c2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu, 2 May 2013 00:04:41 +0200, Fabio Porcedda wrote:

> > I think we generally prefer to store a kernel defconfig, rather
> > than a patch against one of the intree kernel defconfigs.
> 
> I prefer to modify the defconfig intree kernel to be able to use newer
> versions of
> the kernel smoothly with little effort if not any effort.
> 
> IMHO if i store a custom defconfig i need to change it more often
> (maybe for every new kernel version),
> instead patching the intree kernel defconfig is less work for me and
> for the buildroot maintainers.
> 
> IMHO storing a kernel defconfig is better when someone want to use a
> specific kernel version
> and not the latest upstream version with little modifications.

Well, fair enough. I'm not sure it's really easier to maintain, but I
don't have a strong opinion on this.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
