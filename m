From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] sylpheed: remove --program-prefix
Message-ID: <20110912052633.353D18D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6c0ea9684d74440ccd2ef964ef385c81309d21fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sylpheed/sylpheed.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index dbd2408..371341f 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -9,7 +9,7 @@ SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 
-SYLPHEED_CONF_OPT = --disable-gtkspell --program-prefix="" \
+SYLPHEED_CONF_OPT = --disable-gtkspell \
                     --includedir=$(STAGING_DIR)/usr/include
 
 SYLPHEED_DEPENDENCIES = host-pkg-config libgtk2
-- 
1.7.3.4
