From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:20:35 +0200
Subject: [Buildroot] [git commit] package/libpwquality: bump version to 1.4.1
Message-ID: <20190928191544.3A7A28F83F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b69300349325f310c8963cd5a03fdacc327ce195
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpwquality/libpwquality.hash | 2 +-
 package/libpwquality/libpwquality.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpwquality/libpwquality.hash b/package/libpwquality/libpwquality.hash
index 97490f818a..b63501fa16 100644
--- a/package/libpwquality/libpwquality.hash
+++ b/package/libpwquality/libpwquality.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	1de6ff046cf2172d265a2cb6f8da439d894f3e4e8157b056c515515232fade6b	libpwquality-1.4.0.tar.bz2
+sha256	a97d72b5c56b7e279c6e86dad70c1493ea5796f00a596fb9f3173b96f9bf5e46	libpwquality-1.4.1.tar.bz2
 sha256	aa44d09f651bf99b56253187c7778a240740c767d28453ab7fdc9804c842baee	COPYING
diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index 59b0e955fd..bddafd59ca 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPWQUALITY_VERSION = 1.4.0
+LIBPWQUALITY_VERSION = 1.4.1
 LIBPWQUALITY_SOURCE = libpwquality-$(LIBPWQUALITY_VERSION).tar.bz2
 LIBPWQUALITY_SITE = https://github.com/libpwquality/libpwquality/releases/download/libpwquality-$(LIBPWQUALITY_VERSION)
 LIBPWQUALITY_LICENSE = BSD-3-Clause or GPL-2.0+
