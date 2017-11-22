From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:29:27 +0100
Subject: [Buildroot] [git commit] pango: bump to 1.140.14
Message-ID: <20171201205333.11F877FAAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5eb9f431fa29b3572971f28e687d96c15ecd8519
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition, add a hash for the license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.hash | 5 +++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 1b6da7d..6df08e9 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,2 +1,3 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.40/pango-1.40.12.sha256sum
-sha256	75f1a9a8e4e2b28cbc078b50c1fa927ee4ded994d1ade97c5603e2d1f3161cfc	pango-1.40.12.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.40/pango-1.40.14.sha256sum
+sha256	90af1beaa7bf9e4c52db29ec251ec4fd0a8f2cc185d521ad1f88d01b3a6a17e3	pango-1.40.14.tar.xz
+sha256	d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5	COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 79283e8..805d35e 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.40
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).12
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).14
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
