From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 22:43:30 +0100
Subject: [Buildroot] [git commit] network-manager: change display name to
	comply with the naming policy
Message-ID: <20140315214420.BA2399BF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b40f1279796355ee60ecd1ecdb89ff9cc9f98d28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 5b388b7..08ebb72 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_NETWORK_MANAGER
-	bool "NetworkManager"
+	bool "networkmanager"
 	depends on !BR2_avr32 # udev
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
