From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 20 May 2010 18:03:58 +0200
Subject: [Buildroot] [PATCH] [PATCH] aumix SITE has changed
Message-ID: <1274371438-19981-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>


Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/multimedia/aumix/aumix.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/aumix/aumix.mk b/package/multimedia/aumix/aumix.mk
index e28a720..65d9d39 100644
--- a/package/multimedia/aumix/aumix.mk
+++ b/package/multimedia/aumix/aumix.mk
@@ -6,7 +6,7 @@
 
 AUMIX_VERSION=2.8
 AUMIX_SOURCE=aumix-$(AUMIX_VERSION).tar.bz2
-AUMIX_SITE=http://jpj.net/~trevor/aumix
+AUMIX_SITE=http://jpj.net/~trevor/aumix/releases
 AUMIX_AUTORECONF=YES
 
 AUMIX_CONF_OPT = \
-- 
1.6.0.4
