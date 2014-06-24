From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 18:59:06 -0300
Subject: [Buildroot] [PATCHv2] libfreefare: add license information
Message-ID: <1403647146-21314-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfreefare/libfreefare.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 362cab2..1b90c3b 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -7,6 +7,8 @@
 LIBFREEFARE_VERSION = 0.3.4
 LIBFREEFARE_SITE = http://libfreefare.googlecode.com/files
 LIBFREEFARE_DEPENDENCIES = libnfc openssl
+LIBFREEFARE_LICENSE = LGPLv3+ with exception
+LIBFREEFARE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 # openssl needs zlib even if the libfreefare example itself doesn't
-- 
1.8.5.5
