From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:07:07 +0100
Subject: [Buildroot] [git commit branch/next] rygel: bump to version 0.36.1
Message-ID: <20180208220723.9F4BC885E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=421ac4fafb3dd86e3e620f5bd8361478c73e8fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rygel/rygel.hash | 4 ++--
 package/rygel/rygel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rygel/rygel.hash b/package/rygel/rygel.hash
index 028af21bb4..879cbd714b 100644
--- a/package/rygel/rygel.hash
+++ b/package/rygel/rygel.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/rygel/0.36/rygel-0.36.0.sha256sum:
-sha256	31e8ade78b4ea59978d1b59056fa5cd8aef6b9c1457d3dd06de4d2e75a01813f	rygel-0.36.0.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/rygel/0.36/rygel-0.36.1.sha256sum:
+sha256	a67fdd801f6e4121ae44cfffabc0f35fff487cab173b6c6f052449ad7b5fb820	rygel-0.36.1.tar.xz
 
 # Locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index cd8897ceb5..d1bc30589c 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RYGEL_VERSION_MAJOR = 0.36
-RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).0
+RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).1
 RYGEL_SOURCE = rygel-$(RYGEL_VERSION).tar.xz
 RYGEL_SITE = http://ftp.gnome.org/pub/gnome/sources/rygel/$(RYGEL_VERSION_MAJOR)
 RYGEL_LICENSE = LGPL-2.1+, CC-BY-SA-3.0 (logo)
