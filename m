From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 May 2017 14:58:26 +0200
Subject: [Buildroot] [git commit] package/dmidecode: bump version to 3.1
Message-ID: <20170601202856.3069D807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87145472b7c61c9ebbcc3be20c97f8a9025a938f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmidecode/dmidecode.hash | 4 ++--
 package/dmidecode/dmidecode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
index 307c306..1e8154b 100644
--- a/package/dmidecode/dmidecode.hash
+++ b/package/dmidecode/dmidecode.hash
@@ -1,2 +1,2 @@
-# http://http.debian.net/debian/pool/main/d/dmidecode/dmidecode_3.0-2.dsc
-sha256	7ec35bb193729c1d593a1460b59d82d24b89102ab23fd0416e6cf4325d077e45	dmidecode-3.0.tar.xz
+# Locally computed
+sha256 d766ce9b25548c59b1e7e930505b4cad9a7bb0b904a1a391fbb604d529781ac0  dmidecode-3.1.tar.xz
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index b6c59db..b6f96b6 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 3.0
+DMIDECODE_VERSION = 3.1
 DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPL-2.0+
