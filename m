From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 23:04:08 +0200
Subject: [Buildroot] [git commit] libftdi1: add hash for license files
Message-ID: <20180429210822.B6C3A8913D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ca365a73404d02214647f0273707d14294223ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libftdi1/libftdi1.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libftdi1/libftdi1.hash b/package/libftdi1/libftdi1.hash
index 40512a7fc3..f17543fa03 100644
--- a/package/libftdi1/libftdi1.hash
+++ b/package/libftdi1/libftdi1.hash
@@ -1,3 +1,8 @@
 # Locally computed after checking the signature
 # https://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.4.tar.bz2.sig
 sha256  ec36fb49080f834690c24008328a5ef42d3cf584ef4060f3a35aa4681cb31b74  libftdi1-1.4.tar.bz2
+
+# Hash for license files:
+sha256  524f46428bf72bb8c6acfeca4909551fd2e0bdbb5305406d38382f4056095c56  LICENSE
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.GPL
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING.LIB
