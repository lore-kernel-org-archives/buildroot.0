From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 27 Aug 2013 09:52:31 +0200
Subject: [Buildroot] wanna compile busybox and uclib with self modified
 code, please help
In-Reply-To: <BAY167-W75F3A55D10B8CCC0F96A74944A0@phx.gbl>
References: <BAY167-W75F3A55D10B8CCC0F96A74944A0@phx.gbl>
Message-ID: <521C5ABF.4000301@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.08.2013 09:42, schrieb hacklinux:
> Hi thomas,
>
> i have a question concerning buildroot compiling wanna u help . the gz
> pacakge version which i used is buildroot-2012.11.1.tar.gz, i know how
> to build kernel, busybox, initrd following guildlines posted on web
> that puts all sort of items under dl directory and just make it.
> however, i wanna compile the busybox and uclib with some modification
> made by myself, i made several attemps but all failed, can u give me
> some advice on how to do this, wanna hear from u, sincely thank u indeed .
Hello William,

you might want to look at
http://free-electrons.com/blog/buildroot-2011-11/ , especially the
source directory override mechanism.

Regards

Stephan
>
> william wang
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
