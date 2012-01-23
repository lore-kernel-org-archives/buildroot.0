From: Will Newton <will.newton@gmail.com>
Date: Mon, 23 Jan 2012 16:35:09 +0000
Subject: [Buildroot] [PATCH 01/14] jpeg: Allow building of libjpeg for the
	host
Message-ID: <CAFbHwiR7en5qANxRvtOzu=+tvd30s_hT7L7PWzQ=zR2WyxpKqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/jpeg/jpeg.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 555c3e1..a882268 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -16,3 +16,4 @@ endef
 JPEG_POST_INSTALL_TARGET_HOOKS += JPEG_REMOVE_USELESS_TOOLS

 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.1
-------------- next part --------------
