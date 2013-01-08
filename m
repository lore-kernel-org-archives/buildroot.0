From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Jan 2013 00:13:17 +0100
Subject: [Buildroot] [git commit] xserver-xorg_server: Mention that TinyX is
	also known as Kdrive
Message-ID: <20130108232311.78A5A9A6E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=208a81be5b8ecf3108f1f1490a655288a2e7f56a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since several years, the TinyX name has been somewhat deprecated in
favor of Kdrive, so mention the "Kdrive" wording in our configuration
interface.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xserver_xorg-server/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index bea0ffa..e19d356 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -73,7 +73,7 @@ comment "X.org requires largefile and C++ support"
 	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
 
 config BR2_PACKAGE_XSERVER_tinyx
-	bool "TinyX"
+	bool "KDrive / TinyX"
 
 endchoice
 
