From: Stephan Hoffmann <sho@relinux.de>
Date: Sat, 09 Feb 2013 14:04:49 +0100
Subject: [Buildroot] Qt X11 support
In-Reply-To: <51164393.10602@petroprogram.com>
References: <51164393.10602@petroprogram.com>
Message-ID: <51164971.2090507@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 09.02.2013 13:39, schrieb Stefan Fr?berg:
> Hello everyone
>
> Has anyone tried X11 support with Qt lately ?
>
> This was the last thing I could find of the subject:
> http://lists.busybox.net/pipermail/buildroot/2012-March/050769.html
>
> It would be great to have an menuconfig entry under Qt like "Embedded
> Qt" which
> could be on by default but for those who don't need or want Qt with
> framebuffer
> could switch if off.
Hi,

as far as I remember you can select Qt but not X11, which gives you
automatically the embedded version.

I ded this some months ago for my beaglebone with success, but do not
remember if there were other config options needed.

Kind regards

Stephan
>
> Regards
> Stefan
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
