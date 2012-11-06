From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Nov 2012 08:20:17 +0100
Subject: [Buildroot] [git commit] portmap: mention that rpcbind is the
	project that superseds portmap
Message-ID: <20121106072425.EE26299BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c78ccd3b96d6834ee9abc61a93d9ae5a529dafc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/portmap/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
