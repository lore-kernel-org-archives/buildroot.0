From: Wenxi Jin <wjin@vitesse.com>
Date: Wed, 29 Apr 2015 10:06:09 +0000
Subject: [Buildroot] libfcgi:  warning: gethostbyname is obsolescent,
 use getnameinfo() instead
Message-ID: <BL2PR01MB339CCBE30AA445B9A09A27CC4D70@BL2PR01MB339.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
?
I am using libfcgi package which will threw out a warning in the linking stage.
my-buildroot-sdk/sysroots/mips32el-nf-linux/usr/lib/libfcgi.so: warning: gethostbyname is obsolescent, use getnameinfo() instead.
I try to search around and even the official libfcgi website without any luck.
After seeing the patch in buildroot forum, I actually see this warning as well.
The patch is for fixing some other error, but seems no intention to fix this libfcgi warning at all?
Is there any way I could get rid of or surpass this warning, I really want the jenkins build server to be quite.
Thanks so much in advance.


Best regards,
Wenxi Jin

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150429/a247e567/attachment.html>
