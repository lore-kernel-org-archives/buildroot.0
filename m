From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2016 11:03:46 +0100
Subject: [Buildroot] [git commit] package/openal: bump version to 1.17.2
Message-ID: <20160201224703.74B897F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a9cd34e93036eced518619d2947c5b7e6ee648c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openal/openal.hash | 2 +-
 package/openal/openal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index c614180..260f1b7 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 087153baab375c23d7aa7e9f3237c0a1d02e336537b485aee56d9ac312baf6f8 openal-soft-1.17.1.tar.bz2
+sha256	a341f8542f1f0b8c65241a17da13d073f18ec06658e1a1606a8ecc8bbc2b3314	openal-soft-1.17.2.tar.bz2
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 42871fb..4c9a2b6 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.17.1
+OPENAL_VERSION = 1.17.2
 OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
 OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
 OPENAL_LICENSE = LGPLv2+
