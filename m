From: steve at weaverpad.com <steve@weaverpad.com>
Date: Thu, 07 Apr 2016 14:51:42 -0600
Subject: [Buildroot] System seems to hang at banner
In-Reply-To: <f5b9e250975c15010f8287abf3ea65f5@weaverpad.com>
References: <f5b9e250975c15010f8287abf3ea65f5@weaverpad.com>
Message-ID: <efa6d7c13cdf5459a7e48212842df0d1@weaverpad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-04-07 14:02, steve at weaverpad.com wrote:
> The last kernel message I get is:
> "[    0.937209] random: dd urandom read with 12 bits of entropy 
> available"
> Then there's about an 8sec pause before I get only part of the
> "Welcome to Buildroot" banner. I get differing amounts; but, usually
> just "Welcome ". I have tried various values for
> BR2_TARGET_GENERIC_GETTY_PORT and its associated baudrate. I am not
> using the output/target directory; I am using the initramfs built into
> the kernel.
> My board uses a Freescale Kinetis K70. I have the [v3,##/10] ARM
> patchset from Thomas Petazzoni applied.
> 
> Any ideas how I can go about troubleshooting this issue? Is there more
> information required?
> 
> Thanks.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
I retract this question. Just like Masahiro Yamada in 
http://lists.busybox.net/pipermail/buildroot/2015-April/124807.html, I 
had the interrupts configured wrong.
