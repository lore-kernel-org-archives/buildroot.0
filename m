From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Fri, 28 Jul 2017 01:02:27 +0200
Subject: [Buildroot] [PATCH 2/2] package/pkg-kconfig.mk: fix typo in comment
In-Reply-To: <20170727230227.1097-1-m.hoffmann@cartelsol.com>
References: <20170727230227.1097-1-m.hoffmann@cartelsol.com>
Message-ID: <20170727230227.1097-2-m.hoffmann@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
---
 package/pkg-kconfig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 215f01b43..0402f81ff 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -189,7 +189,7 @@ $$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 # which in turn depends on the (newly-set an non-existent) custom
 # defconfig file.
 #
-# Instead, we use an PHONY rule that will catch that situation.
+# Instead, we use a PHONY rule that will catch that situation.
 #
 $(1)-check-configuration-done:
 	@if [ ! -f $$($(2)_DIR)/.stamp_kconfig_fixup_done ]; then \
-- 
2.11.0
