From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Mar 2013 09:25:39 -0300
Subject: [Buildroot] [PATCH] sudo: security bump to version 1.8.6p7
Message-ID: <1363695939-19535-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-1775 and CVE-2013-1776.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sudo/sudo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index a01ac0c..5fd3c61 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SUDO_VERSION = 1.8.6p4
+SUDO_VERSION = 1.8.6p7
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ICS BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
-- 
1.8.1.5
