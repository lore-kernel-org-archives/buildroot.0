From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:33:04 +0200
Subject: [Buildroot] [git commit] s6-rc: bump version to 0.2.0.1
Message-ID: <20170702213031.E4D13803BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13dec76badeefbb5207fd7774011660758b379ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/s6-rc/s6-rc.hash | 2 +-
 package/s6-rc/s6-rc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index 3d5186c..c2def67 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 d04a8a765740ed55e38a33da3639197f51f83b3e498bdef5bc1d1d322b1acff3 s6-rc-0.1.0.0.tar.gz
+sha256 8b01d5b4c2380c6b30d320118b9a9b9ca174a25ed3c75afe8f59a4e840847a76  s6-rc-0.2.0.1.tar.gz
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 1c28dcb..16089dc 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.1.0.0
+S6_RC_VERSION = 0.2.0.1
 S6_RC_SITE = http://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
