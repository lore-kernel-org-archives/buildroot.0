From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:51 +0100
Subject: [Buildroot] [PATCH 17/30] mii-diag: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-17-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mii-diag/mii-diag.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index 702e5a2..a4ad474 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -7,6 +7,8 @@ MII_DIAG_VERSION = 2.11
 MII_DIAG_SOURCE  = mii-diag_$(MII_DIAG_VERSION).orig.tar.gz
 MII_DIAG_PATCH   = mii-diag_$(MII_DIAG_VERSION)-3.diff.gz
 MII_DIAG_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
+MII_DIAG_LICENSE = GPL # No version specified
+MII_DIAG_LICENSE_FILES = mii-diag.c
 
 MII_DIAG_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
 
-- 
1.7.10.4
