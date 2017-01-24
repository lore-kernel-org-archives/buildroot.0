From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:59:57 +1300
Subject: [Buildroot] [git commit] package/terminology: bump to version 1.0.0
Message-ID: <20170124101152.4437581EC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ffcc39bf82b322c2f54c19c8ce6116337f37dbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Announce:
https://sourceforge.net/p/enlightenment/mailman/message/35600707/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/terminology/terminology.hash | 4 ++--
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index 841ff94..86f6606 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,2 +1,2 @@
-# From http://sourceforge.net/p/enlightenment/mailman/message/34472601/
-sha256	ecee7ae6ba2fa10bfc5b6531292157dec2373dbb7d248cc62eb53d0be74e9bcf	terminology-0.9.1.tar.xz
+# From https://sourceforge.net/p/enlightenment/mailman/message/35600707/
+sha256	bfed42b83bce854d35ba33a4d38373c6d42fb2c0ea0335d76420488c091692f4	terminology-1.0.0.tar.xz
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index 86b51c5..d7e9827 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 0.9.1
+TERMINOLOGY_VERSION = 1.0.0
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2c
