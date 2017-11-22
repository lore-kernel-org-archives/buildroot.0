From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:17:12 +0100
Subject: [Buildroot] [git commit branch/next] luasec: bump to version 0.6
Message-ID: <20171122210951.3A1B08102C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa1f589c411df04d6dff0cb27d5abf4465605c73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luasec/luasec.hash | 2 +-
 package/luasec/luasec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 1e9f70a..9d721ed 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d2198cc39b3fa55bd5020046742b34093b6efcb619cf4032948b8c8556202a32  luasec-0.5-2.src.rock
+sha256	1d04e2f70bc055348dda3cc3566d27d8408094bc944aa5c6a4ae18bffe5c0007  luasec-0.6-1.src.rock
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index b059e1c..28c4b2c 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASEC_VERSION = 0.5-2
+LUASEC_VERSION = 0.6-1
 LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
