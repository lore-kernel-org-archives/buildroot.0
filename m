From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 15:05:53 +0200
Subject: [Buildroot] [git commit] perl: remove documentation in target tree
Message-ID: <20140701130717.DB8D29D11E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d1824f367af2f39a979b68dbf645a6e33979cfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 8912791..b3bd91e 100644
--- a/Makefile
+++ b/Makefile
@@ -577,6 +577,7 @@ ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
+	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/pod
 	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE
 	find $(TARGET_DIR)/usr/lib/perl5/ -name '*.bs' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib/perl5/ -name '.packlist' -print0 | xargs -0 rm -f
