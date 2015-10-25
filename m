From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Sun, 25 Oct 2015 09:09:23 +0200
Subject: [Buildroot] [PATCH 1/1] boost.mk spelling error 'SEPERATED' ->
	'SEPARATED'
Message-ID: <1445756963-4755-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>


Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/boost/boost.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index cc3ba9e..8159ed5 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -102,8 +102,8 @@ endif
 BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
 endif
 
-BOOST_WITHOUT_FLAGS_COMMASEPERATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
-BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPERATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPERATED))
+BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
+BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPARATED))
 BOOST_LAYOUT = $(call qstrip, $(BR2_PACKAGE_BOOST_LAYOUT))
 
 define BOOST_CONFIGURE_CMDS
-- 
1.7.9.5
