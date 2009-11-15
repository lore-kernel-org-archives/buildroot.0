From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 15 Nov 2009 11:12:53 +0100
Subject: [Buildroot] [PATCH 4/8] flex: add flex-host package (required by
	webkit)
In-Reply-To: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1258279977-1482-5-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/flex/flex.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 223f58e..fed0d77 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -37,3 +37,4 @@ FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LIBFL
 endif
 
 $(eval $(call AUTOTARGETS,package,flex))
+$(eval $(call AUTOTARGETS,package,flex,host))
-- 
1.6.5.2
