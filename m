From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 20:42:58 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] libmpd: add hash for
 license file
Message-ID: <20181216193903.C500E84D2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a7779ef923fa7d1ba1ab772f5d313177f7ca38a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8e884ba02be77bd91ef2ffe067d4220ce06e9850)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
