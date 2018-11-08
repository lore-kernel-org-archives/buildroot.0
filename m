From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Nov 2018 22:17:20 +0100
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.9.2
Message-ID: <20181108212411.7EEBC81D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c85e9044b32a8ddcf01c499d23c82aa82c90ca1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.samba.org/samba/history/samba-4.9.2.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index ff2e21bc77..4d210ca364 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.1.tar.asc
-sha256 33118cbe83a87be085eba1aae6e597878b02d6ac9b2da67454ed33cf3e9853f2  samba-4.9.1.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.2.tar.asc
+sha256 349c17b7bf1bf667167843470533da89ff1b2ca4a768b529aaacf5197af1efa2  samba-4.9.2.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 1cafe5b623..d95b4edfa4 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.1
+SAMBA4_VERSION = 4.9.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
