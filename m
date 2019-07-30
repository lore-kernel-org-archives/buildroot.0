From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jul 2019 17:27:22 +0200
Subject: [Buildroot] [git commit] package/dtc: add hash for license files
Message-ID: <20190730155429.6D1CC82818@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f5f431463e844bcecf5e74fab366f5da29beec7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
