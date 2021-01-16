From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:19:41 +0100
Subject: [Buildroot] [git commit] package/xorriso: bump version to 1.5.2
Message-ID: <20210116210044.C8CE6864D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce94a8b7ced26e5839cbc0558df1df0d161da3ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.gnu.org/archive/html/bug-xorriso/2019-10/msg00005.html

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xorriso/xorriso.hash | 6 +++---
 package/xorriso/xorriso.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/xorriso/xorriso.hash b/package/xorriso/xorriso.hash
index b594b91438..faaeab5fa0 100644
--- a/package/xorriso/xorriso.hash
+++ b/package/xorriso/xorriso.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 a93fa7ae5bb1902198cddfec25201388156932f36f2f5da829bf4fcae9a6062b  xorriso-1.5.0.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256 72e99e72cd68f226415e5d898f3b38e24ae7991ed038ed72d789fff5b060f028  COPYRIGHT
+sha256  3b69f5c93ae7c40c5bbe4a847fa3963f5efc9c565551622f77121c5792fc17e7  xorriso-1.5.2.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  72e99e72cd68f226415e5d898f3b38e24ae7991ed038ed72d789fff5b060f028  COPYRIGHT
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index 472623ea5e..7b38f268bb 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORRISO_VERSION = 1.5.0
+XORRISO_VERSION = 1.5.2
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPL-3.0+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
