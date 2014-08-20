From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Aug 2014 14:10:13 +0200
Subject: [Buildroot] About i386 Architecture and Grub2
In-Reply-To: <1408534632.82498.YahooMailNeo@web141703.mail.bf1.yahoo.com>
References: <1408534632.82498.YahooMailNeo@web141703.mail.bf1.yahoo.com>
Message-ID: <20140820141013.24de59df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Aug 2014 04:37:12 -0700, lee choon gay wrote:

> But the data is not persistent, anything that I save will be gone after reboot.
> I am looking for method to make the data persistent (no?ram file system).
> I try to boot up the code without using rootfs.cpio as follow.
> The code won't boot up.
> 
> set default="0"
> set timeout="0"
> 
> menuentry "any name" {
> ????????? Linux /boot/bzImage root=/dev/sda2 noinitrd?console=tty1
> ????????? }
> 
> For your info, I use pendrive for this.
> And the bzImage and rootfs.cpio is located in partition 1 boot folder.

If you're using a root filesystem in the second partition, then there's
no point in keeping the rootfs.cpio file in the fist partition.

> File system is located in partition 2.
> 
> Hope I can get some?help here.
> Thank you very much. :)

Yes, but please provide more details, like what happens when you try to
boot, and how you create your second partition exactly. With the
informations you provided, there is just no way for us to help you as
you didn't provide enough details.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
