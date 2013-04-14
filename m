From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 13 Apr 2013 21:23:38 -0300
Subject: [Buildroot] [PATCH 1/4] radvd: bump to version 1.9.3
Message-ID: <1365899021-7675-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/radvd/radvd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 95bfe07..9d1d683 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RADVD_VERSION = 1.9.2
+RADVD_VERSION = 1.9.3
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
 RADVD_AUTORECONF = YES
-- 
1.8.1.5
