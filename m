From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 22:20:23 +0100
Subject: [Buildroot] [git commit] eudev: Fix configure options for
	BR2_PACKAGE_EUDEV_RULES_DEV.
Message-ID: <20160224212131.72DAD7FA85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9e0a401d3cc5f9cf9f24cb9e25f60c80cf259e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ignacy Gaw??dzki <ignacy.gawedzki@green-communications.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/eudev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index fecd37c..942770c 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -30,7 +30,7 @@ EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
 endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
-EUDEV_CONF_OPTS += --enable-rule_generator
+EUDEV_CONF_OPTS += --enable-rule-generator
 endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
