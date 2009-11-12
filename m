From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 12 Nov 2009 15:58:15 +0100
Subject: [Buildroot] Creating a filesystem for QEMU
In-Reply-To: <200911121623.45929.cristeab@gmail.com>
References: <200911121623.45929.cristeab@gmail.com>
Message-ID: <4d28d4b50911120658h67155758k54a7d95599cee1fe@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bogdan,

You have a lot of option :


   - You can generate a cloop root filesystem using buildroot, and then
   convert it to the format you want using qemu-img
   - Create an initramfs, and boot it using qemu
   - Create an ext2 filesystem and write it on a qemu disk through an
   install cdrom
   - and so on....

Regards,

--
Lionel

On Thu, Nov 12, 2009 at 3:23 PM, Bogdan Cristea <cristeab@gmail.com> wrote:

>    I am trying to use QEMU for development of embedded systems using Real
> Time Linux. Buildroot seems to be the tool I need, but I still don't know
> how
> to build a disk image recognized by QEMU. Right now I am trying to use only
> x86 and x86_64 architectures.
>    Does anyone know how to build a file system usable in QEMU ?
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091112/bbb95787/attachment.htm>
