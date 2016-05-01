From: Christian Stewart <christian@paral.in>
Date: Sun, 01 May 2016 03:17:40 +0000
Subject: [Buildroot] [PATCH v2 3/3] aufs-util: new package
In-Reply-To: <1462005755169-4ae010c1-772a9f1f-c4a5bd2a@mixmax.com>
References: <1461936744-1528-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
 <1462005755169-4ae010c1-772a9f1f-c4a5bd2a@mixmax.com>
Message-ID: <1462072661001-44e0c0f0-fb2f8cbc-db24e5f2@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atul,
On Fri, Apr 29, 2016 at 9:32 AM Atul Singh < atul.singh.mandla@rockwellcollins.com > wrote: > + depends on BR2_PACKAGE_AUFS
Does aufs-util have to depend on patching the kernel? This concerns me, because
many kernels include Aufs on default, for example the Odroid XU4 kernel.
See here: https://github.com/hardkernel/linux/tree/odroidxu3-3.10.y/fs/aufs
Thanks, Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160501/f15f0e7b/attachment.html>
