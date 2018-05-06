From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 May 2018 11:38:13 +0200
Subject: [Buildroot] [PATCH 1/1] libmng: add hash for license file
Message-ID: <20180506093813.25129-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmng/libmng.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libmng/libmng.hash b/package/libmng/libmng.hash
index a695cc3706..02a493f414 100644
--- a/package/libmng/libmng.hash
+++ b/package/libmng/libmng.hash
@@ -1,3 +1,6 @@
 # From http://sourceforge.net/projects/libmng/files/libmng-devel/2.0.3/
 md5	e9e899adb1b681b17f14d91e261878c5	libmng-2.0.3.tar.xz
 sha1	0f141482ffcef6f8cd4413f945a59310ac2e49af	libmng-2.0.3.tar.xz
+
+# Hash for license file:
+sha256	ba280734838eb3f22a85b92a7e62de357d4d4c325029dce723b0cb125c417c35	LICENSE
-- 
2.14.1
