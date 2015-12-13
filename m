From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 23:29:10 +0100
Subject: [Buildroot] [git commit] openal: Bump to 1.17.1
Message-ID: <20151213222936.411608182A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90e5cea9cf44dde7eb8131de37273a4111e6d279
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/3b8/3b8dadb1fcb71dae3daf500df95e270c2f86ec3b/
by fixing the jack without pulseaudio bug

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openal/openal.hash | 2 +-
 package/openal/openal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index 26a9919..c614180 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 5e93336de2e7c50f3a01beba51861d6f61c3e4045a896191dc806591e46264d1 openal-soft-1.17.0.tar.bz2
+sha256 087153baab375c23d7aa7e9f3237c0a1d02e336537b485aee56d9ac312baf6f8 openal-soft-1.17.1.tar.bz2
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index ff1cc3d..0580526 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.17.0
+OPENAL_VERSION = 1.17.1
 OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
 OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
 OPENAL_LICENSE = LGPLv2+
