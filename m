From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 31 Mar 2015 16:31:37 +0200
Subject: [Buildroot] [PATCH 1/1] ccache: fix the indentation
Message-ID: <1427812297-6496-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ccache/ccache.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index ac2eaab..893b6ae 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -66,10 +66,10 @@ ccache-stats: host-ccache
 
 ccache-options: host-ccache
 ifeq ($(CCACHE_OPTIONS),)
-$(Q)echo "Usage: make ccache-options CCACHE_OPTIONS=\"opts\""
-$(Q)echo "where 'opts' corresponds to one or more valid ccache options" \
-"(see ccache help text below)"
-$(Q)echo
+	$(Q)echo "Usage: make ccache-options CCACHE_OPTIONS=\"opts\""
+	$(Q)echo "where 'opts' corresponds to one or more valid ccache options" \
+	"(see ccache help text below)"
+	$(Q)echo
 endif
-$(Q)$(CCACHE) $(CCACHE_OPTIONS)
+	$(Q)$(CCACHE) $(CCACHE_OPTIONS)
 endif
-- 
1.9.1
