From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 23 Sep 2007 17:01:10 +0300
Subject: [Buildroot] x11r7 cleanups - /usr/var/log/Xorg.0.log fix
Message-ID: <46F671A6.9030500@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch makes correct log dir for x11r7, otherwise it's trying to create a log in non-existent /usr/var/log/ dir.

Best regards,
Ivan

-------------- next part --------------
A non-text attachment was scrubbed...
Name: xserver_xorg-server-localstatedir.patch
Type: text/x-diff
Size: 1661 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070923/d2f08608/attachment.bin 
