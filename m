From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 15:26:26 +0200
Subject: [Buildroot] [git commit] libcec: add hash for license file
Message-ID: <20180428132846.180EE88F52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=699ffff6be5ec079edf646638636d3969acd0617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcec/libcec.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index 5416c20fec..e7264b40ca 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 b8b8dd31f3ebdd5472f03ab7d401600ea0d959b1288b9ca24bf457ef60e2ba27  libcec-4.0.2.tar.gz
+sha256 3618005b3db4eb8ede7292d233e6c41605cb8dcbd33e8790eff6e29c1e4f3789  COPYING
