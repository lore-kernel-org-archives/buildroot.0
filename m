From: lionel.jourdren at free.fr <lionel.jourdren@free.fr>
Date: Mon, 12 Nov 2012 11:33:39 +0100 (CET)
Subject: [Buildroot] arm920t Linux implementation
In-Reply-To: <20121112112416.0e1b9630@skate>
Message-ID: <1712712534.322996678.1352716419784.JavaMail.root@zimbra29-e5.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

In fact I'm totally new for this kind of things, so as you said, I was just asking, at first, to a theoretical confirmation.
Every thing has been generated so I'm ready to test.
I'll keep all Buildroot mailing list follwers informed...

Many thanks for the response,

Best Regards,

Lionel.

PS : not sure I'm responding correctly (regarding email addresses). Please tell me if I've done something wrong.

----- Mail original -----
De: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
?: "lionel jourdren" <lionel.jourdren@free.fr>
Cc: buildroot at busybox.net
Envoy?: Lundi 12 Novembre 2012 11:24:16
Objet: Re: [Buildroot] arm920t Linux implementation

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
