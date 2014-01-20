From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 20 Jan 2014 11:01:31 +0100
Subject: [Buildroot] uImage for MIPS architecture
In-Reply-To: <CAEk6gTCvgeb5aP88O_ZSN9Y0uqbB+AaFMYm8cW1syd+PR0eokw@mail.gmail.com>
References: <CAEk6gTCvgeb5aP88O_ZSN9Y0uqbB+AaFMYm8cW1syd+PR0eokw@mail.gmail.com>
Message-ID: <CAGduivz2=id74vKyvt2mF5LNtX8Mq-xTRLgjuQTn2sT3iypK9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 20, 2014 at 10:13 AM, Drasko DRASKOVIC
<drasko.draskovic@gmail.com> wrote:
Hi Drasko,
> Hi all,
> in linux/Config.in I can see:
>
> config BR2_LINUX_KERNEL_UIMAGE
> bool "uImage"
> depends on BR2_arm || BR2_armeb || BR2_bfin || BR2_powerpc ||
> BR2_avr32 || BR2_sh || BR2_sh64
> select BR2_LINUX_KERNEL_UBOOT_IMAGE
>
> Why MIPS architecture is not supported?
Well, I don't really see why it shouldn't be.
Would you care to test and send a patch ? :)
>
> Best regards,
> Drasko
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
