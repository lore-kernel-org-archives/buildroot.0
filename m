From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 18:53:02 +0200
Subject: [Buildroot] [git commit] package/openal: bump version to 1.18.1
Message-ID: <20170917164548.2543C800D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c476094892828da4eb4a7ab1c7020ebb41959200
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openal/openal.hash | 2 +-
 package/openal/openal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index cb2586a..aead6e1 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	4433b1391c61a7ca36d82c946c8f0ffe410569d6437e4ce72b3547aaf966ecde	openal-soft-1.18.0.tar.bz2
+sha256 2d51a6529526ef22484f51567e31a5c346a599767991a3dc9d4dcd9d9cec71dd  openal-soft-1.18.1.tar.bz2
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 207526a..439f5f1 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.18.0
+OPENAL_VERSION = 1.18.1
 OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
 OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
 OPENAL_LICENSE = LGPL-2.0+
