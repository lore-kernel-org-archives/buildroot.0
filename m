From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sat, 31 Mar 2018 00:29:12 +0530
Subject: [Buildroot] [PATCH 1/4] opus: add hash for license file
Message-ID: <1522436355-5697-1-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/opus/opus.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 32fe2e2..c1a92d6 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,2 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
 sha256 cfafd339ccd9c5ef8d6ab15d7e1a412c054bf4cb4ecbbbcc78c12ef2def70732  opus-1.2.1.tar.gz
+
+# Hash for license file
+sha256 8338ce8d922bb4416ce3dd1e5680173332435e3f0755007ac7801ccd674fe682  COPYING
-- 
2.7.4
