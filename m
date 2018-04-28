From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 15:25:55 +0200
Subject: [Buildroot] [git commit] libcgroup: add hash for license file
Message-ID: <20180428132845.E007388F52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2364813040777683caec5bafed86138dc6312fcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcgroup/libcgroup.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcgroup/libcgroup.hash b/package/libcgroup/libcgroup.hash
index c671791771..11423e269f 100644
--- a/package/libcgroup/libcgroup.hash
+++ b/package/libcgroup/libcgroup.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  e4e38bdc7ef70645ce33740ddcca051248d56b53283c0dc6d404e17706f6fb51  libcgroup-0.41.tar.bz2
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
