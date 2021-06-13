From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Sun, 13 Jun 2021 12:00:49 +0300
Subject: [Buildroot] Buildroot issue since 9 June 2021 ?
Message-ID: <CACaKL1wUo0VwDyXi--E6n-sdpbTtrzdr3XDdfHjgn4TV1D5=2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
i noticed that, since Thurday 9th June, my BR based project could not build
anymore.
It seems that I was able to build till tag "2021.05" (and all the rc's
before) but not anymore since then.

My build fails on package MTD 2.1.2, where it could not install to target

/bin/install -D -m 0755
/home/jsadva/work/buildroot/output/build/mtd-2.1.2/ubihealthd
/home/jsadva/buildroot/output/target/usr/sbin/ubihealthd
/bin/install: cannot stat
'/home/jsadva/work/buildroot/output/build/mtd-2.1.2/ubihealthd': No such
file or directory
make[1]: *** [package/pkg-generic.mk:341:
/home/jsadva/work/buildroot/output/build/mtd-2.1.2/.stamp_target_installed]
Error 1

Of course, the buildroot "pull" is the only change to my environment,
everything else unchanged (out of tree building)
In the bug tracker, i saw a recently logged issue which is quite similar.

Has somebody faced this recently ?
Jacques

PS: i tried the latest master of BR this morning, with great hopes .....
same result :(
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210613/e4ee8c9d/attachment.html>
