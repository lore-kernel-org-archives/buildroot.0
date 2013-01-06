From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:16 +0100
Subject: [Buildroot] [PATCH 04/28] xserver-xorg_server: Mention that TinyX
	is also known as Kdrive
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d11ab0741ba6dc77f04f5f29a283691f43e45b1a.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since several years, the TinyX name has been somewhat deprecated in
favor of Kdrive, so mention the "Kdrive" wording in our configuration
interface.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
1.7.9.5
