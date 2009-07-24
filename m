From: nfrench at xtale.biz <nfrench@xtale.biz>
Date: Fri, 24 Jul 2009 13:31:34 -0000 (Europe/London)
Subject: [Buildroot] clean build
Message-ID: <51694.172.16.221.10.1248442294.squirrel@172.16.0.251>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



thanks all

> Le Tue, 21 Jul 2009 11:15:22 -0700,
>
Zac Wheeler <zac.wheeler@gmail.com> a ??crit :
>

>> I believe this is in the documentation, but if you create a
directory
>> in buildroot called e.g. permanent_downloads and
make dl/ a symoblic
>> link to that directory, you avoid having
to re-download source
>> packages.
> 
> Or
alternatively, you create a directory outside of the Buildroot tree
> and set the BUILDROOT_DL_DIR environment variable so that it points
to
> this directory. Then all Buildroot executions, even after a
global
> clean, will not re-download the packages.
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
>
consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot
mailing list
> buildroot at busybox.net
>
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090724/1737a32e/attachment.htm>
