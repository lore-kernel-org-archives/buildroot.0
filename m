From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Nov 2012 11:24:16 +0100
Subject: [Buildroot] arm920t Linux implementation
In-Reply-To: <801077173.321754841.1352707282691.JavaMail.root@zimbra29-e5.priv.proxad.net>
References: <803750442.321754226.1352707257219.JavaMail.root@zimbra29-e5.priv.proxad.net>
 <801077173.321754841.1352707282691.JavaMail.root@zimbra29-e5.priv.proxad.net>
Message-ID: <20121112112416.0e1b9630@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lionel,

On Mon, 12 Nov 2012 09:01:22 +0100 (CET), lionel.jourdren at free.fr wrote:

> I?m trying to build up a configuration for a card embedding an ARM
> AT91RM9200 processor.
> 
> I?d like it to work in little endian mode, and expect to get a zImage
> and initrd file for a linux 2.6.38/uClibC 0.9.31
> 
> From what I understood it seems that it?s not necessary  to  set
> BR2_TARGET_ROOTFS_INITRAMFS (which should embedd initramfs in zImage)
> 
> Could someone have a quick look to the configuration below, and see
> if I?ve done something wrong ?

At first sight, nothing looks particularly wrong in your configuration.
But you're not explaining the problem(s) you're facing... so it's hard
to help you. Or are you just seeking a theoretical confirmation that
you configuration looks not too bad?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
