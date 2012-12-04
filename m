From: Santhosh Ramani <srcoolz@gmail.com>
Date: Tue, 4 Dec 2012 10:21:48 -0600
Subject: [Buildroot] Problem with NFS boot
In-Reply-To: <50BDB55A.3070102@relinux.de>
References: <CADKZYYLt90YY8rm4SCuqRN2SsAGqjXhQM7t5hQydpV9o7ZtT+A@mail.gmail.com>
 <50BB309F.606@relinux.de>
 <CADKZYYJZ5Y6BqUwdN9MxCHE70Li8=SKV-WRBrBj=zYwQ3c7U2Q@mail.gmail.com>
 <50BDB55A.3070102@relinux.de>
Message-ID: <CADKZYYLVZc5thKrqpF6FOrkVtkRxg6596CpLpJ90Tvc6jXRVyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stephen, Thomas,

Yes the solution mentioned by Thomas fixed it. Once I enabled devtmpfs...it
mounts it first and the udev starts. Thank you sooo very much.

[    3.581359] VFS: Mounted root (nfs filesystem) on device 0:15.
[    3.588256] devtmpfs: mounted
[    3.591857] Freeing init memory: 228K
Starting logging: OK
Populating /dev using udev: [    4.088989] udevd[712]: starting version 182
done
Initializing random number generator... done.

This is really helpful. thank you
Regards

Santhosh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121204/507c01e9/attachment.html>
