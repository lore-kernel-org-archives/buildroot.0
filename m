From: Heiko Zuerker <heiko@zuerker.org>
Date: Mon, 29 Nov 2010 20:30:28 -0600
Subject: [Buildroot] [PATCH] Disable Grub on x86_64 and update debian patch
Message-ID: <007c01cb9036$8d67b990$a8372cb0$@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Had to send this one as an email, my spamfilter didn't like the binary
content..

 

Grub can only build on multilib x86_64 systems.

Updated debian grub patch to v47 and removed conflicting nic_update patch

 

-- 

 

Regards

   Heiko Zuerker

    <http://www.devil-linux.org> http://www.devil-linux.org

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101129/e6aebc82/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Disable-Grub-on-x86_64-and-update-debian-patch.patch.bz2
Type: application/octet-stream
Size: 341958 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101129/e6aebc82/attachment-0001.obj>
