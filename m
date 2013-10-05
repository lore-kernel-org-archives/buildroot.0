From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2013 21:09:31 +0200
Subject: [Buildroot] [git commit] enchant: bump to version 1.6.0
Message-ID: <20131005191321.6B51C9B92E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bec016d99d66722b1d9527dc8acf7c6388f298e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enchant/enchant.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 8a76c6b..977c37b 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENCHANT_VERSION = 1.5.0
+ENCHANT_VERSION = 1.6.0
 ENCHANT_SOURCE = enchant-$(ENCHANT_VERSION).tar.gz
 ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
