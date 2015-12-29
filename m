From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 19:06:17 +0100
Subject: [Buildroot] [git commit] findutils: bump to version 4.6.0
Message-ID: <20151229180623.2E065826ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=443eb760976e798d168865d4d2d26a7fdc839540
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/findutils/findutils.hash | 2 +-
 package/findutils/findutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/findutils/findutils.hash b/package/findutils/findutils.hash
index 66f1fcc..d5c5519 100644
--- a/package/findutils/findutils.hash
+++ b/package/findutils/findutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	434f32d171cbc0a5e72cfc5372c6fc4cb0e681f8dce566a0de5b6fccd702b62a	findutils-4.4.2.tar.gz
+sha256	ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d	findutils-4.6.0.tar.gz
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index c2c4b39..8f6b099 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FINDUTILS_VERSION = 4.4.2
+FINDUTILS_VERSION = 4.6.0
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPLv3+
 FINDUTILS_LICENSE_FILES = COPYING
