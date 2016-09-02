From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Sep 2016 14:39:53 +0200
Subject: [Buildroot] Remove all kernel modules from a buildroot build
In-Reply-To: <57C920D7.5070104@yahoo.de>
References: <57C920D7.5070104@yahoo.de>
Message-ID: <20160902143953.1bf369ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2 Sep 2016 08:48:55 +0200, Mythbu2 wrote:

> Is there a way of configuring buildroot to omit all this modules and 
> save the space and therefore reduce the image size?

Yes: customize your kernel configuration and remove all the kernel
modules that you don't need.

For the Raspberry Pi, we're using the "bcmrpi" defconfig that comes
from the Linux kernel tree hosted on Github at
https://github.com/raspberrypi/linux.git. If this configuration doesn't
suit you, you simply have to customize it.

See
https://buildroot.org/downloads/manual/manual.html#_configuration_of_other_components
for some details.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
