From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 19:40:46 +0200
Subject: [Buildroot] [PATCH 14/20] portmap: mention that rpcbind is the
	project that superseds portmap
In-Reply-To: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <aae61f5152331e0d8e63c01ddca703e00cde1382.1344706801.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/portmap/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/portmap/Config.in b/package/portmap/Config.in
index f017cb6..8d25e3a 100644
--- a/package/portmap/Config.in
+++ b/package/portmap/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PORTMAP
 	help
 	  The standard portmapper for RPC services.
 
+	  Note that portmap is being deprecated in favour of rpcbind.
+
 	  http://neil.brown.name/portmap/
 
 comment "portmap requires a toolchain with RPC support"
-- 
1.7.9.5
