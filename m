From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Aug 2015 10:16:06 +0200
Subject: [Buildroot] [git commit branch/next] package/exim: bump version to
	4.86
Message-ID: <20150808105652.898DC7FE0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14c4100f44d91b27cb629ed569af26e79dc42553
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exim/exim.hash |    4 ++--
 package/exim/exim.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index e29d9dc..0c0d797 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,2 +1,2 @@
-# From https://lists.exim.org/lurker/message/20150113.003827.4a5d30e4.en.html
-sha256	13211f2bbc5400d095a9b4be075eb1347e0d98676fdfe4be8a3b4d56281daaa4	exim-4.85.tar.bz2
+# From https://lists.exim.org/lurker/message/20150726.143052.f70a32f0.en.html
+sha256	f1ccf2ce2ea51b7fbbf160e7e0e41d24ca401cf44a185128ad99ea04635fc456	exim-4.86.tar.bz2
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 002ffd2..62267b7 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.85
+EXIM_VERSION = 4.86
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
