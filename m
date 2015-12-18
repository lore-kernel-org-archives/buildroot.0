From: hong zhang <henryzhang62@yahoo.com>
Date: Fri, 18 Dec 2015 21:58:50 +0000 (UTC)
Subject: [Buildroot] add user script to /etc/rc before rootfs is created
References: <1161230987.710604.1450475930986.JavaMail.yahoo.ref@mail.yahoo.com>
Message-ID: <1161230987.710604.1450475930986.JavaMail.yahoo@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

List,
I add user script to /etc/rc/... so that the script can be executed right after kernel is up.
What I am doing now is:After building first rootfs, expand rootfs and add my script to /etc/rc... area.

Is it possible to add my script to buildroot before rootfs is created?
---henry
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151218/bf3ef9a2/attachment.html>
