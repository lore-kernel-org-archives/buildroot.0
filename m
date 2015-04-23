From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Thu, 23 Apr 2015 09:55:26 +0200
Subject: [Buildroot] Reminder about your pending Buildroot patches
In-Reply-To: <20150421124300.484EB88C@mail.free-electrons.com>
References: <20150421124300.484EB88C@mail.free-electrons.com>
Message-ID: <CABbD_XBToj-mNoOo13_+3DgL8cV3vkQiEFZmjaNzSkYsWjzTow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

 - [v3] inetutils: new package
>    http://patchwork.ozlabs.org/patch/443641/


Still relevant, these are the modifications required by you at V2 :) If the
user doesn't select busybox (rarely) than this is the only package the
could provide a telnet client.

 - [v4] linux-headers: allow use of headers from kernel "package" selected
>    http://patchwork.ozlabs.org/patch/444770/


Requires more discussion I think, Alexey accepted it, you didn't like the
implementation (choosy). The usefulness of this package is also contested.

 - system/system.mk: modify fstab according to GENERIC_REMOUNT_ROOTFS_RW
>    http://patchwork.ozlabs.org/patch/450199/


Still relevant, as BR Readonly ROOTFS is currently broken (?) because
/etc/fstab always mounts as RW. Requires double check.

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150423/ca5e62a5/attachment.html>
