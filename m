From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Jul 2019 12:55:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: add hash for license files
Message-ID: <20190729105509.29288-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dtc/dtc.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index e197d88967..4d0aaea601 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -1,2 +1,6 @@
 # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
 sha256 c672e443c9f7e39f5a7c8e602da6777f9ad55ad70de87de300a43828c8050172  dtc-1.5.0.tar.xz
+
+# Hash for license files
+sha256 171ce1c292cf148a5be9ff95ce7e5c3d79a002721ab8e119eae3c0f5336d2b3d  README.license
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  GPL
-- 
2.20.1
