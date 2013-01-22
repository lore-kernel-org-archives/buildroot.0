From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 10:35:53 -0300
Subject: [Buildroot] [PATCH 8/8] genext2fs: add license information
In-Reply-To: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358861753-5990-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/genext2fs/genext2fs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index 6126a74..45e9695 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -7,6 +7,8 @@
 GENEXT2FS_VERSION = 1.4.1
 GENEXT2FS_SOURCE = genext2fs-$(GENEXT2FS_VERSION).tar.gz
 GENEXT2FS_SITE = http://downloads.sourceforge.net/project/genext2fs/genext2fs/$(GENEXT2FS_VERSION)
+GENEXT2FS_LICENSE = GPLv2
+GENEXT2FS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.12.4
