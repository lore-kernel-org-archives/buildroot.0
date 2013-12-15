From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 09:27:14 +0100
Subject: [Buildroot] [git commit] ccid: bump to version 1.4.14
Message-ID: <20131215090215.C48DA9C017@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=892a8fbfdcb937c4d3291f119d5fcce9b0ab807e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fixup _SITE typo]
Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccid/ccid.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index aabc0c0..f39edce 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.13
+CCID_VERSION = 1.4.14
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
-CCID_SITE = http://alioth.debian.org/frs/download.php/file/3959
+CCID_SITE = http://alioth.debian.org/frs/download.php/file/3971
 CCID_LICENSE = LGPLv2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
