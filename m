From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Jun 2013 13:26:58 -0300
Subject: [Buildroot] [PATCH] strace: fix legal info
Message-ID: <1370881618-16167-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license file changed from COPYRIGHT->COPYING. Fixes:
http://autobuild.buildroot.net/results/b61/b61e1775cd1eec83470424e88ced5bd49e0cd469/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/strace/strace.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 0dce096..9addbb6 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -8,7 +8,7 @@ STRACE_VERSION = 4.8
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3c
-STRACE_LICENSE_FILES = COPYRIGHT
+STRACE_LICENSE_FILES = COPYING
 
 STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
 		  ac_cv_header_linux_netlink_h=yes
-- 
1.8.1.5
