From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  9 Nov 2012 12:55:09 +0000
Subject: [Buildroot] [PATCH] strace: add license information
Message-ID: <1352465709-19523-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/strace/strace.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index ad1d042..349dc2c 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -7,6 +7,8 @@
 STRACE_VERSION = 4.7
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
+STRACE_LICENSE = BSD-3c
+STRACE_LICENSE_FILES = COPYRIGHT
 
 STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
 		  ac_cv_header_linux_netlink_h=yes
-- 
1.7.10.4
