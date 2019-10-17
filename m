From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 17 Oct 2019 16:29:02 +0100
Subject: [Buildroot] [RFC PATCH v2 03/30] package/libkrb5: Add host tools
 package.
In-Reply-To: <20191017152929.49153-1-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
Message-ID: <20191017152929.49153-4-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/libkrb5/libkrb5.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 56345416aa..43b15f0c13 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -58,3 +58,4 @@ LIBKRB5_CONF_OPTS += --disable-thread-support
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
