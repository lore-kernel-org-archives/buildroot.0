From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Oct 2011 16:10:16 +0200
Subject: [Buildroot] [git commit] portmap: use common syntax for RPC support
	needed comment
Message-ID: <20111011142358.37C518E305@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bb3143d5c274a0aa9b2d40a88a365e3e428d2e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/portmap/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/portmap/Config.in b/package/portmap/Config.in
index 1f22ab6..5914357 100644
--- a/package/portmap/Config.in
+++ b/package/portmap/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_PORTMAP
 
 	  http://neil.brown.name/portmap/
 
-comment "portmap requires a toolchain with 'Enable RPC' selected"
+comment "portmap requires a toolchain with RPC support"
 	depends on !BR2_INET_RPC
