From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 11:43:49 +0200
Subject: [Buildroot] [git commit] libmpd: add hash for license file
Message-ID: <20180520095026.6ACD380404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e884ba02be77bd91ef2ffe067d4220ce06e9850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmpd/libmpd.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmpd/libmpd.hash b/package/libmpd/libmpd.hash
index ca06c754fb..c0e5c6b3c3 100644
--- a/package/libmpd/libmpd.hash
+++ b/package/libmpd/libmpd.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	fe20326b0d10641f71c4673fae637bf9222a96e1712f71f170fca2fc34bf7a83	libmpd-11.8.17.tar.gz
+sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
