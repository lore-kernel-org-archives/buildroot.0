From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 22:57:46 +0200
Subject: [Buildroot] [git commit] package/sysklogd: replace utf-8 space by
 ascii character
Message-ID: <20190507210157.E1CEB815D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6865c94d73a95356dab96b4fe03bfc392af9b9fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-#??From git
+# From git
 SYSKLOGD_AUTORECONF = YES
 
 define SYSKLOGD_INSTALL_SAMPLE_CONFIG
