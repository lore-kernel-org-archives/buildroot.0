From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:35:49 +0100
Subject: [Buildroot] [git commit] mii-diag: add license info
Message-ID: <20121114214730.C6B8499B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bbe6cc414b954dc29ef0a351cd4ea72ba636da3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mii-diag/mii-diag.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
 
