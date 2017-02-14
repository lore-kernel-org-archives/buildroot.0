From: Erwan Gautron <erwan.gautron@yahoo.fr>
Date: Tue, 14 Feb 2017 10:37:54 +0000 (UTC)
Subject: [Buildroot] [PATCH 1/1] raptor: install package to staging
References: <287040233.7034245.1487068674711.ref@mail.yahoo.com>
Message-ID: <287040233.7034245.1487068674711@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>
??? Need raptor in staging for building rasqal, redland.
??? raptor, rasqal and redland are all parts of librdf.org??? (rasqal and redland packages intregration will come later)
??? 
Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>
---
?package/raptor/raptor.mk | 2 +-
?1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
index aea14e3..de5127f 100644
--- a/package/raptor/raptor.mk
+++ b/package/raptor/raptor.mk
@@ -13,7 +13,7 @@ RAPTOR_LICENSE_FILES = LICENSE.txt
?
?# Flag is added to make sure the patch is applied for the configure.ac of raptor.
?RAPTOR_AUTORECONF = YES
-
+RAPTOR_INSTALL_STAGING = YES
?RAPTOR_CONF_OPTS =\
???? --with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config \
???? --with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config
-- 
2.7.4

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170214/e11f8e28/attachment.html>
