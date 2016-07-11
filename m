From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2016 14:11:39 +0200
Subject: [Buildroot] [git commit] package/tzdata: bump version to 2016f
Message-ID: <20160711121220.CCC3E821A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c64f76bf8b9de20486e84a273a422b78a42ee786
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 9f1859e..1d7fbcd 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2016-June/000039.html
-sha512	dace0f6fc87a73879ca3a1b143d7dcf9c50803e23e6b8c91f83711704e28129af776676c547c42f14dee7f1e8e285ce25296e53a52d11f4c8f155b5f80f4beb3 	tzdata2016e.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2016-July/000040.html
+sha512 0472f9516b6c3d83c0a5d0953a5535f4c48d9b9171e125f528188dac512f3556bc1805b7029c4f467a122cbce1beb4e804dd4ae63b259952de3bb217f8e8941d	tzdata2016f.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 17da3a1..de7d1be 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2016e
+TZDATA_VERSION = 2016f
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
