From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Feb 2011 19:55:33 +0100
Subject: [Buildroot] Problem when running a Qt program on AT91SAM9M10
In-Reply-To: <1759946353.864.1298362207553.JavaMail.root@Tesla.Syntronic.com>
References: <1411107015.845.1298361874825.JavaMail.root@Tesla.Syntronic.com>
	<1759946353.864.1298362207553.JavaMail.root@Tesla.Syntronic.com>
Message-ID: <20110222195533.1b8c6294@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Feb 2011 09:10:07 +0100 (CET)
Anders Gabert <anga@syntronic.com> wrote:

> I have a problem when running a Qt example program on AT91SAM9M10. 
> 
> I?m using Buildroot 2010.11 and have selected and compiled Qt. 
> I get a bunch of Qt libs under usr/lib. 
> 
> To test Qt I have compiled the calculator under the example widgets
> when running it on the unit a get the error below. As you can see
> there are characters missing in the error text. When looking in the
> Qt code, I think the last line should be ?Cannot create Qt for
> Embedded Linux data directory: %s?. Has anyone had the same problem
> or a solution to it. 
> 
> # ./calculator -qws 

I have just tested the calculator example on a simple ARM system built
by Buildroot, and it works fine here in Qemu.

Could you give some details: your Buildroot .config, and the procedure
you use to build the calculator application.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
