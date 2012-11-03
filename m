From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Nov 2012 18:47:56 +0100
Subject: [Buildroot] [PATCH 11/18] portmap: mention that rpcbind is the
	project that superseds portmap
In-Reply-To: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <832783c6a9c05b930f01e8f282ca715c64d28c2e.1351964808.git.thomas.petazzoni@free-electrons.com>
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
