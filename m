From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 21:42:15 +0100
Subject: [Buildroot] [git commit] package/mrouted: update description a bit,
 mention oper. requirement
Message-ID: <20210123202257.712E77FAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=761c7e24cf14c0139f6431b0c8033d8db7c7d69a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mrouted/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index e5d9348d1b..95b4fb3825 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -3,5 +3,11 @@ config BR2_PACKAGE_MROUTED
 	depends on BR2_USE_MMU # fork()
 	help
 	  An implementation of the DVMRP multicast routing protocol.
+	  Unlike PIM a DVMRP router has a distance vector protocol (like
+	  RIP) built-in to figure out the reverse-path to the multicast
+	  source. This package comes with mrouted and mroutectl.  Where
+	  the latter is used to query status and control operation.
+
+	  Note: at least two interfaces with MULTICAST flag is requried.
 
 	  http://github.com/troglobit/mrouted
