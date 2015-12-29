From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 18:17:30 +0100
Subject: [Buildroot] [PATCH] pandaboard_defconfig: bump u-boot to
 2015.10 and kernel to 4.3
In-Reply-To: <CANu7NGv=i4F+ZsDWLwu6L4RvtQTRgBKpjsup+6gn0LYJaPF3hw@mail.gmail.com>
References: <1450978394-822-1-git-send-email-sergio.prado@e-labworks.com>
 <20151227120631.78043b59@free-electrons.com>
 <CANu7NGsP5K4268wtVMAcvUD+OaTxdEUvnV8aaoVqFhY1X-oOfg@mail.gmail.com>
 <20151229140021.054e6740@free-electrons.com>
 <20151229140134.6dce652c@free-electrons.com>
 <CANu7NGv=i4F+ZsDWLwu6L4RvtQTRgBKpjsup+6gn0LYJaPF3hw@mail.gmail.com>
Message-ID: <20151229181730.01ab8093@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Tue, 29 Dec 2015 15:14:27 -0200, Sergio Prado wrote:

> I've just confirmed that the Beaglebone Black has the same geometry
> requirements.
> 
> The generated sdcard image works in this case because the processor's ROM
> code will by default load U-Boot from the internal eMMC, that will read the
> images (kernel, dtb, rootfs) from the external sdcard. So if you have
> U-Boot in the internal eMMC, it will work.
> 
> But if you try to boot U-Boot from external sdcard (holding S2) it won't
> work.

Ah, not good then.

> In the meantime, can we keep the previous approach of just documenting the
> process of generating the image in the readme.txt?

Yes, definitely.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
