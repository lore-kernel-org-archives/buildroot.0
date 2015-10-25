From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 22:01:40 +0100
Subject: [Buildroot] [git commit] boost.mk spelling error 'SEPERATED' ->
	'SEPARATED'
Message-ID: <20151025210816.8EE647FE27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49580efc4ab76d9e8629e9f7bacf3c3e634cdf99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
