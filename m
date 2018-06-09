From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Jun 2018 16:34:23 +0200
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.8.2
Message-ID: <20180609144025.D5F9C8777B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78e020726c8af031c9f38153d58aded4716b80d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.samba.org/samba/history/samba-4.8.2.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 85d0e18b52..cadb88b260 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.8.1.tar.asc
-sha256 8ef7367507f16b7a5e2f6aed5bcdbd1143feca79aa2a07c9b21292b17d7f789d  samba-4.8.1.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.8.2.tar.asc
+sha256 62e552296d49e6ab44bb87d120a288813fa52e42435d53a1f71b77596512bf22  samba-4.8.2.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index b03af34cd0..f75b350375 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.8.1
+SAMBA4_VERSION = 4.8.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
