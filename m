From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Jun 2014 22:10:59 -0300
Subject: [Buildroot] [PATCH] musl: bump to version 1.1.3
Message-ID: <1403745059-25642-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/musl/musl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 7b59377..2278799 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.2
+MUSL_VERSION = 1.1.3
 MUSL_SITE = http://www.musl-libc.org/releases/
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
1.8.5.5
