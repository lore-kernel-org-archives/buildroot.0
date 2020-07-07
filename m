From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jul 2020 21:57:12 +0200
Subject: [Buildroot] [git commit] package/valijson: bump version to 0.3
Message-ID: <20200707195630.37C23844D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93271c9e029560abdd753d958fca033d3ec70518
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/valijson/valijson.hash | 2 +-
 package/valijson/valijson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
index 6f11000669..e184ccb7c0 100644
--- a/package/valijson/valijson.hash
+++ b/package/valijson/valijson.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  77dbebb40dab2e834557c2fcc39122cdb2d0fe26bf591c2b3e0df5a316a45592  valijson-0.2.tar.gz
+sha256  2ac881a36f90810b41b66511502dea1e7886137ad31bcfb4e917d929c5028c35  valijson-0.3.tar.gz
 sha256  1a0f99926a2dbec30eba3db820236d9953fbe3048976923ac24980e655fbe991  LICENSE
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index 31efeede34..b38c6319a6 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALIJSON_VERSION = 0.2
+VALIJSON_VERSION = 0.3
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
