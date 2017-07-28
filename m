From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 29 Jul 2017 00:47:26 +0200
Subject: [Buildroot] [git commit] package/pkg-kconfig.mk: fix typo in comment
Message-ID: <20170728224459.B62657F9AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=412a872e217e1e6569afb65b5113199f30b199ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-kconfig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 215f01b..0402f81 100644
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
