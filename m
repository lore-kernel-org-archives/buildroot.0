From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 21 Sep 2019 22:33:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/pv: bump to version 1.6.6
Message-ID: <20190921203318.30829-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pv/pv.hash | 5 ++++-
 package/pv/pv.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index 291d6dd06f..1ce1191d54 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	0ece824e0da27b384d11d1de371f20cafac465e038041adab57fcf4b5036ef8d  pv-1.6.0.tar.bz2
+sha256	608ef935f7a377e1439c181c4fc188d247da10d51a19ef79bcdee5043b0973f1  pv-1.6.6.tar.bz2
+
+# Hash for license file
+sha256  280e182171df3e9bb4a9b407326e88521151fcb8f4f8557255f26177d5900ccf  doc/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 0ef5a6f6a2..122cc0c5ca 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.6.0
+PV_VERSION = 1.6.6
 PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = Artistic-2.0
-- 
2.23.0
