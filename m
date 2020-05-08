From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 May 2020 22:02:49 +0200
Subject: [Buildroot] [git commit] package/matchbox: add hash for license file
Message-ID: <20200508194816.62A467FE23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f59e2c01a78c99c933df49ee681cdd3e11f4b07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file, add sha256 for tarball and update indentation
for hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox.hash | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/matchbox/matchbox.hash b/package/matchbox/matchbox.hash
index f00ed4e4f3..fdb8f7d119 100644
--- a/package/matchbox/matchbox.hash
+++ b/package/matchbox/matchbox.hash
@@ -1,2 +1,6 @@
 # From http://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/1.2/matchbox-window-manager-1.2.tar.bz2.md5
-md5	3e158dcf57823b55c926d95b245500fb	matchbox-window-manager-1.2.tar.bz2
+md5  3e158dcf57823b55c926d95b245500fb  matchbox-window-manager-1.2.tar.bz2
+
+# Locally computed
+sha256  81a23a4af797cf350759fd5ac738797015a66dd5dba2f3d9f3c6908506c1ceff  matchbox-window-manager-1.2.tar.bz2
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
