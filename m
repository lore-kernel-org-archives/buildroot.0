From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 14 Mar 2014 11:26:36 +0100
Subject: [Buildroot] [PATCH 5/5] network-manager: change display name to
	comply with the naming policy
In-Reply-To: <1394792796-25656-1-git-send-email-yegorslists@googlemail.com>
References: <1394792796-25656-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1394792796-25656-5-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
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
-- 
1.7.7
