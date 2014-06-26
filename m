From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:34 -0300
Subject: [Buildroot] [PATCH 06/53] dfu-util: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dfu-util/dfu-util.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index c58c347..e960a92 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -6,6 +6,8 @@
 
 DFU_UTIL_VERSION = 0.6
 DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases/
+DFU_UTIL_LICENSE = GPLv2+
+DFU_UTIL_LICENSE_FILES = COPYING
 
 HOST_DFU_UTIL_DEPENDENCIES = host-libusb
 
-- 
1.8.5.5
