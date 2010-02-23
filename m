From: Roo <roo.watt@gmail.com>
Date: Wed, 24 Feb 2010 10:15:18 +1100
Subject: [Buildroot] Newbie: AT91SAM9260 NAND Boot
In-Reply-To: <hm0su3$h9k$1@dough.gmane.org>
References: <815f0bd71002221951v606dbdddn381587fdd662e485@mail.gmail.com>
	<hm0su3$h9k$1@dough.gmane.org>
Message-ID: <815f0bd71002231515m11ed502bxa3268af876dcdafb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24 February 2010 02:40, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> On 2010-02-23, Roo <roo.watt@gmail.com> wrote:
>
>> I am new to buildroot and have been given a AT91SAM9260 SOM to
>> work with. The latest buildroot does not appear to include a
>> defconfig for a NAND boot system.
>
> Can you explain what a "NAND boot system" is?
>
> When I boot an AT91SAM9xxx from NAND, I tell buildroot to build
> a JFFS2 root image, a uImage kernel with MTD/JFFS2 support, put
> the resulting kernel and root image into NAND, and configure U-Boot
> to boot from NAND.

I believe that I had some of the terminology wrong.

I would like a jffs (or a readonly FS) to reside in NAND as you had
described, but I was confused by the dataflash/dataflashcard
terminology. I thought it was referring to a SD or micro SD card and I
do not want the rootfs or kernel to reside on the card.

My understanding now is that configurations relate to where the
bootloader resides rather than where the rootfs resides. I am little
embarrassed that I didn't realise this earlier and if I am right this
just got easier. :)

I have only just started looking with buildroot, I have inherited the
platform and didn't have any real input into its selection or design
so I am still trying to find my feet.

Thanks for taking the time to respond to a newbie.

Regards,

Cameron.
