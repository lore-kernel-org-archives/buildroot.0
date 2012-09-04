From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 04 Sep 2012 20:30:12 +0200
Subject: [Buildroot] fs skeleton quick rebuild
In-Reply-To: <CAE9DZUQi+OEhWzW0Hu1bBrBhs6QZ+_V=J1MwFej_H2EAhhdM4A@mail.gmail.com>
References: <CAE9DZUQi+OEhWzW0Hu1bBrBhs6QZ+_V=J1MwFej_H2EAhhdM4A@mail.gmail.com>
Message-ID: <504648B4.6010301@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 04.09.2012 19:59, schrieb Dallas Clement:
> Greetings:
>
> I'm working on a custom skeleton for my rootfs and wanting to make
> changes and test without having to rebuild everything.  Is there an
> easy way to do this?
Hi,

I figured out that
1. remove output/target
2. remove output/build/.root
3. remove all .stamp_target_installed files
give a quite fast, clean rebuild of the root file system.

Hope that helps

Stephan
> Thanks,
>
> Dallas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
