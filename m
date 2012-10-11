From: Alexander Khryukin <alexander@mezon.ru>
Date: Thu, 11 Oct 2012 16:06:58 +0400
Subject: [Buildroot] intltool version update 0.50.2
Message-ID: <CABtOAfxghzGTxUdjydjDXxk094ApfOXr8Qp=v-oXvBBuf2SANA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/11 Alexander Khryukin <alexander@mezon.ru>
Signed-off-by: Alexander Khryukin <alexander@mezon.ru>

commit c32a92a45e5ca725c0e332d938f21e6d7fac1fe7
Author: Alexander Khryukin <alexander@mezon.ru>
Date:   Thu Oct 11 12:07:09 2012 +0000

    version update 0.50.2

diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 19b5238..38f82e7 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -4,9 +4,9 @@
 #
 #############################################################

-INTLTOOL_VERSION = 0.40.6
+INTLTOOL_VERSION = 0.50.2
 INTLTOOL_SOURCE = intltool-$(INTLTOOL_VERSION).tar.bz2
-INTLTOOL_SITE = http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/
+INTLTOOL_SITE =
https://launchpad.net/intltool/trunk/$(INTLTOOL_VERSION)/+download/intltool-$(INTLTOOL_VERSION).tar.gz

 HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
 HOST_INTLTOOL_CONF_OPT = \
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121011/25bbfe77/attachment.html>
