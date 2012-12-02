From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 02 Dec 2012 11:42:39 +0100
Subject: [Buildroot] Problem with NFS boot
In-Reply-To: <CADKZYYLt90YY8rm4SCuqRN2SsAGqjXhQM7t5hQydpV9o7ZtT+A@mail.gmail.com>
References: <CADKZYYLt90YY8rm4SCuqRN2SsAGqjXhQM7t5hQydpV9o7ZtT+A@mail.gmail.com>
Message-ID: <50BB309F.606@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 02.12.2012 02:51, schrieb Santhosh Ramani:
> Hello Stephan,
>
> Thank you for your reply, yes I did untar the rootfs.tar.bz2 into the
> folder that is exported as NFS using sudo. 
>
> Note:
> Linux kernel from TI SDK + buildroot rootfs = no nfs (only SD Card)
> Linux kernle from buildroot + buildroot rootfs = everything works fine.
Hello Santhosh,

reading this I suggest double checking the kernel versions and
configurations. I assume the rootfs' are the same, aren't they?


>
> I actually have a script that performs a distclean on the Linux folder
> and then tars and copies the linux kernel into the dl folder for
> buildroot. And I have set it up so that buildroot uses this custom kernel.
>
> However there are times when I make minor modifications to the Kernel
> code and then try it out in which case it fails. That's what I'm
> trying to fix.
Why don't you build the modified kernel with buildroot?
>
> Please do let me know if I can provide more information.
> Thank you
> Regards
>
> Santhosh
>
>
> -- 
> Greater the Difficulty....Sweeter is the Victory
;-)

Good luck

Stephan
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121202/d640e5f5/attachment.html>
