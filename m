From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  9 Apr 2018 22:17:49 +0200
Subject: [Buildroot] [PATCH 1/1] libcap-ng: add hash for license files
Message-ID: <20180409201749.32641-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcap-ng/libcap-ng.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index 8058ed9e97..f8342ea928 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256 4a1532bcf3731aade40936f6d6a586ed5a66ca4c7455e1338d1f6c3e09221328 libcap-ng-0.7.9.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
+sha256 f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa COPYING.LIB
-- 
2.14.1
