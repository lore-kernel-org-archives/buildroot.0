From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 21:48:30 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/samba4: bump
 version to 4.10.9
Message-ID: <20191031211115.43CF88E355@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b8427d31f6034966e39bdd593ebea98ade22734
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Release notes:
https://www.samba.org/samba/history/samba-4.10.9.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f772f352394cc459ecf6b9dde3dd225b548d67d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 7d41ad8fbf..e88fe3d147 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.10.8.tar.asc
-sha256 c41f05fb567f7359998b451543501c7690a2bf6551d658a76bd6916316a410f4  samba-4.10.8.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.10.9.tar.asc
+sha256 366df54dc43ff8cb2d3f94fad2a8e8561a398d94ab64b86761778843b5e61678  samba-4.10.9.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 172bdb3b8f..dc0210e884 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.10.8
+SAMBA4_VERSION = 4.10.9
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
