From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 10:53:18 +0200
Subject: [Buildroot] [git commit] package/neon: add license hash
Message-ID: <20190804085221.D65C58122D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7781cb19246c5298848049831c121661ac524e1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neon/neon.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/neon/neon.hash b/package/neon/neon.hash
index d66b6fd74c..2ebefbe520 100644
--- a/package/neon/neon.hash
+++ b/package/neon/neon.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
 sha256	db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d1b15d3d967fbca	neon-0.30.2.tar.gz
+# Locally computed
+sha256 95f77624e96f6728145826fc895142275451f43f41c073766db3dbbcc8b790b0  README
+sha256 d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
+sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
