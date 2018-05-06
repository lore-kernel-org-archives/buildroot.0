From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 May 2018 17:34:18 +0200
Subject: [Buildroot] [git commit] libmnl: add hash for license file
Message-ID: <20180506153533.81CB88B800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b02e3303fcfc1ff09588ee022c7994c8b9d97f28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmnl/libmnl.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libmnl/libmnl.hash b/package/libmnl/libmnl.hash
index 98385b857c..e5bb2fa603 100644
--- a/package/libmnl/libmnl.hash
+++ b/package/libmnl/libmnl.hash
@@ -1,3 +1,6 @@
 # From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.4.tar.bz2.{md5sum,sha1sum}
 md5	be9b4b5328c6da1bda565ac5dffadb2d	libmnl-1.0.4.tar.bz2
 sha1	2db40dea612e88c62fd321906be40ab5f8f1685a	libmnl-1.0.4.tar.bz2
+
+# Hash for license file:
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
