From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 10 Oct 2019 17:59:10 +0100
Subject: [Buildroot] [RFC PATCH v1 15/25] package/alsa-lib/alsa-lib: Add
 host package.
In-Reply-To: <20191010165920.72050-1-michael.drake@codethink.co.uk>
References: <20191010165920.72050-1-michael.drake@codethink.co.uk>
Message-ID: <20191010165920.72050-16-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/alsa-lib/alsa-lib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index fecf7d7cfa..7502a91259 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -67,3 +67,4 @@ ALSA_LIB_CONF_ENV = \
 	LDFLAGS="$(TARGET_LDFLAGS) -lm"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
