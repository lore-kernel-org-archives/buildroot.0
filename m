From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 18:09:44 +0200
Subject: [Buildroot] [git commit] libao: add hash for license file
Message-ID: <20180429161010.72C118A286@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b23f3f804f24c90f0fe3a52e5a2de2bfe89d476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libao/libao.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libao/libao.hash b/package/libao/libao.hash
index 64174dad8f..dced3dddeb 100644
--- a/package/libao/libao.hash
+++ b/package/libao/libao.hash
@@ -1,2 +1,5 @@
 # From http://downloads.xiph.org/releases/ao/SHA256SUMS.txt
 sha256	03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf	libao-1.2.0.tar.gz
+
+# Hash for license file:
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
