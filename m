From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 08:54:00 +0200
Subject: [Buildroot] [git commit] package/libp11: fix help text
Message-ID: <20190407065146.011548DF59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7e098ac1d89e285e19b2f1617190394759e790a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a check-package warning:

package/libp11/Config.in.host:4: help text: <tab><2 spaces><62 chars>
 (http://nightly.buildroot.org/#writing-rules-config-in)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libp11/Config.in.host | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libp11/Config.in.host b/package/libp11/Config.in.host
index ccc171025a..8da081f868 100644
--- a/package/libp11/Config.in.host
+++ b/package/libp11/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_LIBP11
 	bool "host libp11"
 	help
-	  OpenSSL engine for PKCS#11 modules.  Part of the OpenSC project.
+	  OpenSSL engine for PKCS#11 modules. Part of the OpenSC
+	  project.
 
 	  https://github.com/OpenSC/OpenSC/wiki
