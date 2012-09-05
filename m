From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed,  5 Sep 2012 17:28:59 +0300
Subject: [Buildroot] [PATCH 4/9] firefox: installing default extensions
	needs host-xmlstarlet dependency
In-Reply-To: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1346855344-15081-5-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/xmlstarlet/xmlstarlet.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 5919619..e58b200 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -16,3 +16,4 @@ XMLSTARLET_CONF_OPT += --disable-static-libs \
 	--with-libiconv-prefix=${STAGING_DIR}/usr
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.7.6
