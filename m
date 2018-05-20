From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 11:43:53 +0200
Subject: [Buildroot] [git commit] libnetfilter_log: add hash for license file
Message-ID: <20180520095026.82FBD80404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db0f6437c081fc3ecc8ad48141bd6d7e95f56bbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnetfilter_log/libnetfilter_log.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libnetfilter_log/libnetfilter_log.hash b/package/libnetfilter_log/libnetfilter_log.hash
index 4fe6a9b8b6..292538db5d 100644
--- a/package/libnetfilter_log/libnetfilter_log.hash
+++ b/package/libnetfilter_log/libnetfilter_log.hash
@@ -1,3 +1,6 @@
 # From ftp://ftp.netfilter.org/pub/libnetfilter_log/libnetfilter_log-1.0.1.tar.bz2.{md5sum,sha1sum}
 md5	2a4bb0654ae675a52d2e8d1c06090b94	libnetfilter_log-1.0.1.tar.bz2
 sha1	0b95bcb1ad15eea906fa3607cd6c2290bd48d5bd	libnetfilter_log-1.0.1.tar.bz2
+
+# Hash for license file:
+sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
