From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:41 +0100
Subject: [Buildroot] [PATCH 07/30] e2fsprogs: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-7-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/e2fsprogs.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index e958158..5b3b7d0 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -6,6 +6,8 @@
 
 E2FSPROGS_VERSION = 1.42.6
 E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v$(E2FSPROGS_VERSION)
+E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
+E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
 
 E2FSPROGS_CONF_OPT = \
 	--disable-tls \
-- 
1.7.10.4
