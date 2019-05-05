From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 May 2019 12:12:39 +0200
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.9.7
Message-ID: <20190505100747.7ADBD84266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d365099fec760d3b25bd3d0640b6c8148689e9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.samba.org/samba/history/samba-4.9.7.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 7762456cfd..9576690e4f 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.6.tar.asc
-sha256 c9205a651a83d69e200fec9dd65e9fa360f0c75ab3275b3dcb74e5cbaec60807  samba-4.9.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.7.tar.asc
+sha256 44e5bc58dcae6d86ca8d5f269fa927f20ff91bce97cde86fe4e83addcb89c001  samba-4.9.7.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index f6dbda9dbb..941d4df1d6 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.6
+SAMBA4_VERSION = 4.9.7
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
