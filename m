From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  2 Nov 2014 09:13:51 +0200
Subject: [Buildroot] [PATCH] live555: bump to version 2014.11.01
Message-ID: <3bb2bf1c7c36499239d15955ecb02530a9121bf3.1414912431.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a hash file. Upstream provides md5 only.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/live555/live555.hash | 2 ++
 package/live555/live555.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/live555/live555.hash

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
new file mode 100644
index 000000000000..8c3ae63d0335
--- /dev/null
+++ b/package/live555/live555.hash
@@ -0,0 +1,2 @@
+# From http://live555.com/liveMedia/public/live555-latest-md5.txt
+md5	61ec3927fdff01fdaa831238a857b660	live.2014.11.01.tar.gz
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 72b1264a2684..e933faaeae01 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2014.05.27
+LIVE555_VERSION = 2014.11.01
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPLv2.1+
-- 
2.1.1
