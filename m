From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:43:31 +0200
Subject: [Buildroot] [git commit] opus: add hash for license file
Message-ID: <20180330194951.5270E83EF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6911750391b07a5fdda0fdaf43409941858318d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 32fe2e245b..c1a92d6b94 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,2 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
 sha256 cfafd339ccd9c5ef8d6ab15d7e1a412c054bf4cb4ecbbbcc78c12ef2def70732  opus-1.2.1.tar.gz
+
+# Hash for license file
+sha256 8338ce8d922bb4416ce3dd1e5680173332435e3f0755007ac7801ccd674fe682  COPYING
