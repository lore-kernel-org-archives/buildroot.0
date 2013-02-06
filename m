From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Wed, 6 Feb 2013 16:17:26 +0000
Subject: [Buildroot] makedevs and symbolic links
Message-ID: <CAJkQPOn=Pi+NhbRvVG_gk9ccQDaUoUuPH3aEsos032kAv6Y23A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I use Buildroot with my own custom root fs skeleton. My skeleton contains a
few symbolic links that I'd like to move out either into
the BR2_ROOTFS_POST_BUILD_SCRIPT or somewhere else.

makedevs seemed logical but it doesn't support symbolic link creation.

Is there a reason for this?

Would it be useful to add it?

Aras
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130206/d9f9abbf/attachment.html>
