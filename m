From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 06 Sep 2011 15:52:33 +0200
Subject: [Buildroot] [PATCH] openssh: bump to 5.9p1
Message-ID: <4E6625A1.2010105@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/openssh/openssh.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/package/openssh/openssh.mk
===================================================================
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSH_VERSION = 5.8p2
+OPENSSH_VERSION = 5.9p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
