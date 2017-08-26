From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 26 Aug 2017 21:58:06 +0200
Subject: [Buildroot] [for-next 3/3] package/terminology: bump to 1.1.0
In-Reply-To: <20170826195806.18802-1-romain.naour@gmail.com>
References: <20170826195806.18802-1-romain.naour@gmail.com>
Message-ID: <20170826195806.18802-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See: https://sourceforge.net/p/enlightenment/mailman/message/36004555/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/terminology/terminology.hash | 4 ++--
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index 86f6606..c203226 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,2 +1,2 @@
-# From https://sourceforge.net/p/enlightenment/mailman/message/35600707/
-sha256	bfed42b83bce854d35ba33a4d38373c6d42fb2c0ea0335d76420488c091692f4	terminology-1.0.0.tar.xz
+# Locally calculated
+sha256	eb9136e487ab9e6ff3c98173919b5ad105626434d096dafecd18392fc40c348f	terminology-1.1.0.tar.xz
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index dbfec2e..817521d 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.0.0
+TERMINOLOGY_VERSION = 1.1.0
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
-- 
2.9.5
