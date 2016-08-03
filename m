From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Aug 2016 20:47:05 +0200
Subject: [Buildroot] [git commit] alsa-lib: bump version to 1.1.2
Message-ID: <20160803185356.95F3F821AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a8ca194acc5644be1630c6920cbdbf16a8d2e7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 49be643..47542e5 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	8ac76c3144ed2ed49da7622ab65ac5415205913ccbedde877972383cbc234269	alsa-lib-1.1.1.tar.bz2
+sha256 d38dacd9892b06b8bff04923c380b38fb2e379ee5538935ff37e45b395d861d6  alsa-lib-1.1.2.tar.bz2
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index f1958de..a86d6bb 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.1.1
+ALSA_LIB_VERSION = 1.1.2
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPLv2.1+ (library), GPLv2+ (aserver)
