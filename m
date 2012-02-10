From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 10 Feb 2012 14:06:33 +0100
Subject: [Buildroot] [git commit] ipsec-tools: cleanup: remove trailing .
	after option text
Message-ID: <20120210130757.2F65290A57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6252ef7fc3a3e85678da62c69436c5f656c348fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ipsec-tools/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index d4c62c6..6f6dc37 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -10,7 +10,7 @@ if BR2_PACKAGE_IPSEC_TOOLS
 
 config BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT
 	default y
-	bool "Enable racoonctl(8)."
+	bool "Enable racoonctl(8)"
 	help
 	  Lets racoon to listen to racoon admin port, which is to
 	  be contacted by racoonctl(8).
@@ -28,7 +28,7 @@ config BR2_PACKAGE_IPSEC_TOOLS_NATT
 	  NAT-Traversal might infringe a patent.
 
 config BR2_PACKAGE_IPSEC_TOOLS_FRAG
-	bool "Enable IKE fragmentation."
+	bool "Enable IKE fragmentation"
 	help
 	  Enable IKE fragmentation, which is a workaround for
 	  broken routers that drop fragmented packets
@@ -40,11 +40,11 @@ config BR2_PACKAGE_IPSEC_TOOLS_DPD
 
 config BR2_PACKAGE_IPSEC_TOOLS_STATS
 	default y
-	bool "Enable statistics logging function."
+	bool "Enable statistics logging function"
 
 config BR2_PACKAGE_IPSEC_TOOLS_READLINE
 	select BR2_PACKAGE_READLINE
-	bool "Enable readline input support if available."
+	bool "Enable readline input support"
 
 choice
 	prompt "Security context"
