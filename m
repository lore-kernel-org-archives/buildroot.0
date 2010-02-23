From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 23 Feb 2010 15:40:52 +0000 (UTC)
Subject: [Buildroot] Newbie: AT91SAM9260 NAND Boot
References: <815f0bd71002221951v606dbdddn381587fdd662e485@mail.gmail.com>
Message-ID: <hm0su3$h9k$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-02-23, Roo <roo.watt@gmail.com> wrote:

> I am new to buildroot and have been given a AT91SAM9260 SOM to
> work with. The latest buildroot does not appear to include a
> defconfig for a NAND boot system.

Can you explain what a "NAND boot system" is?

When I boot an AT91SAM9xxx from NAND, I tell buildroot to build
a JFFS2 root image, a uImage kernel with MTD/JFFS2 support, put
the resulting kernel and root image into NAND, and configure U-Boot
to boot from NAND.

> I would like to use buildroot to build the rootfs, kernel and
> tools required for our application. I would appreciate any
> advice on where to start with this, is there any reason that a
> NAND boot defconfig does not exist currently?

Presumably because nobody has bothered to submit one.

> Will it be a difficult job to develop one?

I'm still not sure what you're after beyond selecting JFFS2 for
the root fs type and enabling MTD and JFFS2 support in the
kernel.  Can you explain what it is you're missing?

-- 
Grant Edwards                   grante             Yow! I just got my PRINCE
                                  at               bumper sticker ... But now
                               visi.com            I can't remember WHO he
                                                   is ...
