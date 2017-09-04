From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  4 Sep 2017 19:50:42 +0200
Subject: [Buildroot] [PATCH 08/12] rings: add LICENSE_FILES
In-Reply-To: <20170904175046.21530-1-francois.perrad@gadz.org>
References: <20170904175046.21530-1-francois.perrad@gadz.org>
Message-ID: <20170904175046.21530-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/rings/rings.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index 151546aea..92001bbf4 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -8,5 +8,6 @@ RINGS_VERSION_MAJOR = 1.3.0
 RINGS_VERSION = $(RINGS_VERSION_MAJOR)-1
 RINGS_SUBDIR = rings-v_$(subst .,_,$(RINGS_VERSION_MAJOR))
 RINGS_LICENSE = MIT
+RINGS_LICENSE_FILES = $(RINGS_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
-- 
2.11.0
