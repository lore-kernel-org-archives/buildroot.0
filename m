From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Apr 2020 22:20:16 +0200
Subject: [Buildroot] [git commit] package/tzdata: bump to version 2020a
Message-ID: <20200427200542.178E59093B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7656cae01e2f5a0168b0b758dbcbc71cb50ba049
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Dahl <post@lespocky.de>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tzdata/tzdata.hash | 6 +++---
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index e2338f13fe..8f0a9050fc 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2019-September/000057.html
-sha512 2921cbb2fd44a6b8f7f2ed42c13fbae28195aa5c2eeefa70396bc97cdbaad679c6cc3c143da82cca5b0279065c02389e9af536904288c12886bf345baa8c6565 tzdata2019c.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2020-April/000058.html
+sha512  2a2fc2e3ad8a6e4c574242296c847ad582c2c1d86add9c556e65c812d19b9528522e3c4dddb5239017091825d2acc5a2ccaf21dc41b900b6c300ef4264cc5a9d  tzdata2020a.tar.gz
 # Locally computed:
-sha256 0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf LICENSE
+sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index b656bc7f7f..b405f895cd 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2019c
+TZDATA_VERSION = 2020a
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
