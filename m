From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 11 Oct 2012 09:54:14 +0200
Subject: [Buildroot] Using a patched kernel
In-Reply-To: <003701cda713$ad86eb10$0894c130$@net>
References: <003701cda713$ad86eb10$0894c130$@net>
Message-ID: <50767B26.6090209@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 10.10.2012 20:18, schrieb Chris Wilkinson:
> Is it possible in BR to use a custom patched version of a Linux kernel
> rather than have it get the standard one? 
Yes, use "source override".

Stephan wrote:
>  Frequently Asked Questions
>  ==========================
>  
> +How can I use sources from my local PC instead of the official tarball?
> +-----------------------------------------------------------------------
> +
> +Just use the "Source Directory Override" mechanism.
> +
> +You have to add a file local.mk to your project.  This file should
> +contain the following definition:
> +
> +<package>_OVERRIDE_SRCDIR = wherever.your.source.lives
> +
> +Then announce this file to buildroot in the "Build options" menu as
> +"location of a package override file".
> +
>  

> successfully built with crosstool-ng-1.16.0 and would like to use that.
Didn't know that crosstool can build kernels;-)

Stephan
> Chris
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
