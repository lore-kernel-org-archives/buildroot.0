From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jan 2012 13:29:05 -0300
Subject: [Buildroot] [PATCH 1/4] sudo: bump to version 1.7.8p1
Message-ID: <1327422548-20906-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sudo/sudo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 9c62c49..f10d294 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SUDO_VERSION = 1.7.7
+SUDO_VERSION = 1.7.8p1
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
 
 SUDO_CONF_OPT = \
-- 
1.7.3.4
