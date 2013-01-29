From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jan 2013 15:23:58 -0300
Subject: [Buildroot] [PATCH 09/10] kismet: add license information
In-Reply-To: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1359483839-25357-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/kismet/kismet.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index c8ae8e3..3787f07 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -7,6 +7,8 @@
 KISMET_VERSION = 2011-03-R2
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = libpcap ncurses
+KISMET_LICENSE = GPLv2+
+KISMET_LICENSE_FILES = GPL
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	KISMET_DEPENDENCIES += libnl
-- 
1.7.12.4
