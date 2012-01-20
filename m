From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Jan 2012 16:14:22 -0300
Subject: [Buildroot] [PATCH 1/2] libidn: bump to version 1.24
Message-ID: <1327086863-9470-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libidn/libidn.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 4708862..935240b 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-LIBIDN_VERSION = 1.19
-LIBIDN_SITE = http://ftp.gnu.org/gnu/libidn/
+LIBIDN_VERSION = 1.24
+LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPT = --disable-java --enable-csharp=no
-- 
1.7.3.4
