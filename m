From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Nov 2014 22:04:59 +0100
Subject: [Buildroot] [git commit] live555: bump to version 2014.11.01
Message-ID: <20141102212605.0F466B2E13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5837f364e77bf7ea71d8f2de97bda4dc243ce80d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a hash file. Upstream provides md5 only, so add a locally generated
sha256.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.hash |    4 ++++
 package/live555/live555.mk   |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
new file mode 100644
index 0000000..d05b18b
--- /dev/null
+++ b/package/live555/live555.hash
@@ -0,0 +1,4 @@
+# From http://live555.com/liveMedia/public/live555-latest-md5.txt
+md5	61ec3927fdff01fdaa831238a857b660	live.2014.11.01.tar.gz
+# Locally generated
+sha256	0896b3b787771496436fd0fad4a6a6905c46d4df50088a412216bf360975ca99	live.2014.11.01.tar.gz
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 72b1264..e933faa 100644
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
