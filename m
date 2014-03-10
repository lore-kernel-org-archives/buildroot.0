From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Mar 2014 17:26:31 -0300
Subject: [Buildroot] [PATCH 11/14] macchanger: bump to version 1.6.0
In-Reply-To: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394483194-17592-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also switch the homepage, it's not a proper one but at least it's no
longer a 404.
The license is now GPLv2+ but there's no COPYING file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/macchanger/Config.in     | 2 +-
 package/macchanger/macchanger.mk | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/macchanger/Config.in b/package/macchanger/Config.in
index e26faa7..a9ebc8e 100644
--- a/package/macchanger/Config.in
+++ b/package/macchanger/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_MACCHANGER
 	  A GNU/Linux utility for viewing/manipulating the MAC address of
 	  network interfaces
 
-	  http://www.alobbs.com/macchanger
+	  http://www.gnu.org/software/macchanger
diff --git a/package/macchanger/macchanger.mk b/package/macchanger/macchanger.mk
index 8656183..5ded0b8 100644
--- a/package/macchanger/macchanger.mk
+++ b/package/macchanger/macchanger.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-MACCHANGER_VERSION = 1.5.0
+MACCHANGER_VERSION = 1.6.0
 MACCHANGER_SITE = $(BR2_GNU_MIRROR)/macchanger
-MACCHANGER_LICENSE = GPLv2
-MACCHANGER_LICENSE_FILES = COPYING
+MACCHANGER_LICENSE = GPLv2+
 
 $(eval $(autotools-package))
-- 
1.8.3.2
