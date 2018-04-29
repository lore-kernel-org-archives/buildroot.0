From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 16:17:53 +0200
Subject: [Buildroot] [git commit] libaio: add hash for license file
Message-ID: <20180429142028.A47148821B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d41f916fb9b82ebbdbb6e995fdf1b1e7331e689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libaio/libaio.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libaio/libaio.hash b/package/libaio/libaio.hash
index 7aa8961fbf..5917e2f783 100644
--- a/package/libaio/libaio.hash
+++ b/package/libaio/libaio.hash
@@ -1,2 +1,5 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/liba/libaio/libaio_0.3.110-1.dsc
 sha256	e019028e631725729376250e32b473012f7cb68e1f7275bfc1bbcdd0f8745f7e	libaio_0.3.110.orig.tar.gz
+
+# Hash for license file:
+sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING
