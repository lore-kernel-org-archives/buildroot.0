From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:15:58 +0200
Subject: [Buildroot] [git commit] package/dav1d: bump version to 0.5.0
Message-ID: <20191020133507.9A7AC82DE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1d56bb945f6bd1bab8fd3337312b4331c09a271
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c2e/c2e5b1d8c59d9ca37f06efc67c0928f7df1096ce/

due to upstream commit
https://code.videolan.org/videolan/dav1d/commit/e65abadff6872d319ece76c8617604c628c3126e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dav1d/dav1d.hash | 2 +-
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index 594531100c..0f0fc938f3 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 18bf96c5168b8c704422387620fefaa953e8dbd4eacb0f0796c03d6e741f8924  dav1d-0.4.0.tar.bz2
+sha256 b29c159bf7c56e8b6ae81bb24704599819fa89399ec3d6db3dbc052d7bc5baf8  dav1d-0.5.0.tar.bz2
 sha256 b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 0e9c79bd34..0aed796cab 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 0.4.0
+DAV1D_VERSION = 0.5.0
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
 DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
