From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 10 Oct 2019 17:58:59 +0100
Subject: [Buildroot] [RFC PATCH v1 04/25] jpeg-turbo: Add host install
In-Reply-To: <20191010165920.72050-1-michael.drake@codethink.co.uk>
References: <20191010165920.72050-1-michael.drake@codethink.co.uk>
Message-ID: <20191010165920.72050-5-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Preston <thomas.preston@codethink.co.uk>

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/jpeg-turbo/jpeg-turbo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 3735132b2e..aafcc6c222 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -38,3 +38,4 @@ endef
 JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_USELESS_TOOLS
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1
