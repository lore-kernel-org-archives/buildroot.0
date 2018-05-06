From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 May 2018 09:03:42 +0200
Subject: [Buildroot] [git commit] libnpth: add hash for license file
Message-ID: <20180506071548.2974A8641C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb2f40e2d6258c9c5a2b3348cebf4920ba2f59f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnpth/libnpth.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libnpth/libnpth.hash b/package/libnpth/libnpth.hash
index f8cfefa448..251d54badf 100644
--- a/package/libnpth/libnpth.hash
+++ b/package/libnpth/libnpth.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking signature
 sha256 294a690c1f537b92ed829d867bee537e46be93fbd60b16c04630fbbfcd9db3c2  npth-1.5.tar.bz2
+
+# Hash for license file:
+sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING.LIB
