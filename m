From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Apr 2019 08:39:44 +0200
Subject: [Buildroot] [PATCH] package/libp11: fix help text
Message-ID: <20190407063944.22260-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Trent Piepho <tpiepho@impinj.com>
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
-- 
2.14.1
