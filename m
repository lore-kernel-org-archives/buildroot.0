From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 25 May 2017 11:07:21 +0100
Subject: [Buildroot] [PATCH next] vdr: bump version to 2.3.5
Message-ID: <20170525100721.2071-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/vdr/vdr.hash | 6 +++---
 package/vdr/vdr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index b4800d53f..2ced98d96 100644
--- a/package/vdr/vdr.hash
+++ b/package/vdr/vdr.hash
@@ -1,4 +1,4 @@
-# From https://www.linuxtv.org/pipermail/vdr/2017-April/029243.html
-md5 7b1c985d5e7703f7ec46e3818f546702  vdr-2.3.4.tar.bz2
+# From https://www.linuxtv.org/pipermail/vdr/2017-May/029263.html
+md5 01fabef4d20ec01f11d53354d99a9642  vdr-2.3.5.tar.bz2
 # Locally computed
-sha256 97600301e8bb16ac6a6ed58c0b7c18a48e3ab1cc7130311d405178109777c03a  vdr-2.3.4.tar.bz2
+sha256 323fd01e4f8daef24bbdcb906023d18c998a204a22de110d1cb0089532e818b5  vdr-2.3.5.tar.bz2
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index 694081389..6c4656624 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VDR_VERSION = 2.3.4
+VDR_VERSION = 2.3.5
 VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
 VDR_SITE = ftp://ftp.tvdr.de/vdr/Developer
 VDR_LICENSE = GPL-2.0+
-- 
2.13.0
