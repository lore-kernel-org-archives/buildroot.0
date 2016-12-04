From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 16:30:24 +0100
Subject: [Buildroot] [git commit] package/tzdata: bump version to 2016j
Message-ID: <20161204153131.4CF607FEBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de90d77dc1164a0f933cd5aac9f43ac9278b7172
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 1d7fbcd..b98e579 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2016-July/000040.html
-sha512 0472f9516b6c3d83c0a5d0953a5535f4c48d9b9171e125f528188dac512f3556bc1805b7029c4f467a122cbce1beb4e804dd4ae63b259952de3bb217f8e8941d	tzdata2016f.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2016-November/000044.html
+sha512 ce0b9958b764479fac7df6b5ba0933fc4c6d815ebccc2537c75c4be105691cd58054704eebfb50ca755d7d48504480d4925ce8836eb499ae4798e3d5503d7e0e	tzdata2016j.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index de7d1be..d628514 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2016f
+TZDATA_VERSION = 2016j
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
