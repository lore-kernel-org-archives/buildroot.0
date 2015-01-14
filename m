From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 14 Jan 2015 21:43:06 +0100
Subject: [Buildroot] [PATCH 3/3] package/exim: bump version to 4.85, add hash
In-Reply-To: <1421268186-6702-1-git-send-email-bernd.kuhls@t-online.de>
References: <1421268186-6702-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1421268186-6702-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.hash |    2 ++
 package/exim/exim.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/exim/exim.hash

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
new file mode 100644
index 0000000..e29d9dc
--- /dev/null
+++ b/package/exim/exim.hash
@@ -0,0 +1,2 @@
+# From https://lists.exim.org/lurker/message/20150113.003827.4a5d30e4.en.html
+sha256	13211f2bbc5400d095a9b4be075eb1347e0d98676fdfe4be8a3b4d56281daaa4	exim-4.85.tar.bz2
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index c42c7c1..34a6893 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.84
+EXIM_VERSION = 4.85
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
-- 
1.7.10.4
