From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:15:03 +0000
Subject: [Buildroot] [PATCH v1 16/30] package/alsa-lib/alsa-lib: Add host
 package.
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-17-michael.drake@codethink.co.uk>
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
index 72e6c34282..026f0be07c 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -67,3 +67,4 @@ ALSA_LIB_CONF_ENV = \
 	LDFLAGS="$(TARGET_LDFLAGS) -lm"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
