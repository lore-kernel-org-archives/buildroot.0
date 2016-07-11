From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2016 14:11:35 +0200
Subject: [Buildroot] [git commit] package/zic: bump version to 2016f
Message-ID: <20160711121220.C2A5F818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b04033fc3304223a2c4962640e75934d2b8d386
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 7a231a8..360575a 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2016-June/000039.html
-sha512	dcaf615ada96920e60ffb336253f53541861153decc156d41661f43e0bfb128c6c231b0b776bbe3f2176549346275fc5a879074f4977d5141228e58cb33a41c6	tzcode2016e.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2016-July/000040.html
+sha512 97d084f4b0a688fef097dca256083ca9948393848d77c8ee637bdd26f859150cce7d2b26fc1165a3b44b28cc1c9075e10192332261ed68990b4b21a85438b023	tzcode2016f.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 2e7d1cc..8a0c8dc 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2016e
+ZIC_VERSION = 2016f
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
