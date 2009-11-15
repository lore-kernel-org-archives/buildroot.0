From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 15 Nov 2009 11:12:55 +0100
Subject: [Buildroot] [PATCH 6/8] gperf: add gperf-host package (required by
	webkit)
In-Reply-To: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1258279977-1482-7-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/gperf/gperf.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index bb2d4f3..57e0663 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -20,3 +20,4 @@ endef
 GPERF_POST_INSTALL_HOOKS += GPERF_INSTALL_STRIP
 
 $(eval $(call AUTOTARGETS,package,gperf))
+$(eval $(call AUTOTARGETS,package,gperf,host))
-- 
1.6.5.2
