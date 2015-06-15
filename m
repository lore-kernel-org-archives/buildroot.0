From: Hoang Tran <hoang.tran@vnoss.org>
Date: Mon, 15 Jun 2015 10:59:34 -0400
Subject: [Buildroot] [PATCH 1/1] fs/romfs: add U-Boot image support
In-Reply-To: <20150615165125.43be39d5@free-electrons.com>
References: <1433782196-17824-1-git-send-email-hoang.tran@vnoss.org>
 <20150614232937.6805b496@free-electrons.com>
 <CAEiL7jJV6kaRnfi1HnSJEzrfaO_bQ4_dF+bX0p15wewC0QqOkw@mail.gmail.com>
 <20150615165125.43be39d5@free-electrons.com>
Message-ID: <CAEiL7j+J_ZVu29C-BZ97DA5Ne=v0-X=jD2rMr3XrzTBwvMs1JA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 15, 2015 at 10:51 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Hoang Tran,
>
> On Mon, 15 Jun 2015 10:46:08 -0400, Hoang Tran wrote:
>
>> Sorry I did not response because of the problem of my email client.
>> But anyway I agree with Arnout.
>> My rootfs is in romfs and I intended to make a uRamdisk for quick testing.
>> But we could use cpio Ramdisk instead.
>
> a "uRamdisk" can be in cpio format. Basically the "u" is just a
> container for a ramdisk, and the ramdisk itself can use the cpio
> format, or ext2, or whatever filesystem you want. However, by using
> cpio, you leverage the initramfs mechanism of the kernel, which is much
> better than initrd in terms of memory consumption.
>
> See:
>
>   https://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt
>

I get it. That is really useful. Thank you.

Hoang
