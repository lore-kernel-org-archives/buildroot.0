From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:27 +0200
Subject: [Buildroot] [PATCH v1 07/28] package/sysklogd: replace utf-8 space
 by ascii character
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/sysklogd/sysklogd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 8cd7f9573c..266c171170 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -8,7 +8,7 @@ SYSKLOGD_VERSION = 1.6
 SYSKLOGD_SITE = $(call github,troglobit,sysklogd,v$(SYSKLOGD_VERSION))
 SYSKLOGD_LICENSE = GPL-2.0+
 SYSKLOGD_LICENSE_FILES = COPYING
-#?From git
+# From git
 SYSKLOGD_AUTORECONF = YES

 define SYSKLOGD_INSTALL_SAMPLE_CONFIG
--
2.21.0
