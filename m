From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 14 Jul 2012 22:31:57 +0200
Subject: [Buildroot] [PATCH 3/6] icu: remove redundant HOST_ICU_DEPENDENCIES
In-Reply-To: <1342297879-9881-1-git-send-email-arnout@mind.be>
References: <1342297879-9881-1-git-send-email-arnout@mind.be>
Message-ID: <1342297917-10997-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/icu/icu.mk |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index a2c24ca..42416b7 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -8,7 +8,6 @@ ICU_VERSION = 4.8.1.1
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_DEPENDENCIES = host-icu
-HOST_ICU_DEPENDENCIES =
 ICU_INSTALL_STAGING = YES
 ICU_CONF_OPT = --with-cross-build=$(HOST_ICU_DIR)/source --disable-samples \
 		--disable-tests
-- 
tg: (bd3c98f..) t/host-no-circular-dep-3-icu (depends on: t/host-no-circular-dep-file)
