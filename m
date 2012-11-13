From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:39 +0100
Subject: [Buildroot] [PATCH 05/30] dmalloc: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dmalloc/dmalloc.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index e2fdda4..42e2e64 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -7,6 +7,10 @@ DMALLOC_VERSION:=5.4.3
 DMALLOC_SOURCE:=dmalloc-$(DMALLOC_VERSION).tgz
 DMALLOC_SITE:=http://dmalloc.com/releases
 
+DMALLOC_LICENSE = MIT-like
+# license is in each file, dmalloc.h.1 is the smallest one
+DMALLOC_LICENSE_FILES = dmalloc.h.1
+
 DMALLOC_INSTALL_STAGING = YES
 DMALLOC_CONF_OPT:= --enable-shlib
 
-- 
1.7.10.4
