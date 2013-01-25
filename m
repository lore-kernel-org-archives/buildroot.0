From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Jan 2013 09:50:40 -0300
Subject: [Buildroot] [PATCH 4/4] sudo: bump to version 1.8.6p4
In-Reply-To: <1359118240-2397-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359118240-2397-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1359118240-2397-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sudo/sudo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index e6b554c..a01ac0c 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SUDO_VERSION = 1.8.6
+SUDO_VERSION = 1.8.6p4
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ICS BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
-- 
1.7.12.4
