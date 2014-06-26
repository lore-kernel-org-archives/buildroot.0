From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:05 -0300
Subject: [Buildroot] [PATCH 37/53] lshw: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-37-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lshw/lshw.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index cc00347..ee15350 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -6,6 +6,8 @@
 
 LSHW_VERSION = B.02.16
 LSHW_SITE = http://ezix.org/software/files
+LSHW_LICENSE = GPLv2
+LSHW_LICENSE_FILES = COPYING
 
 LSHW_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_ENABLE_LOCALE),)
-- 
1.8.5.5
