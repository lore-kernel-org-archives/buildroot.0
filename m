From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:41 -0300
Subject: [Buildroot] [PATCH 13/53] fis: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fis/fis.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index e9426a1..876b127 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -7,6 +7,8 @@
 FIS_SITE = http://svn.chezphil.org/utils/trunk
 FIS_SITE_METHOD = svn
 FIS_VERSION = 2892
+FIS_LICENSE = GPLv2+
+FIS_LICENSE_FILES = fis.c
 
 define FIS_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) -std=c99 -o $(@D)/fis \
-- 
1.8.5.5
