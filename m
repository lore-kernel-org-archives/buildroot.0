From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Oct 2013 23:07:28 +0200
Subject: [Buildroot] [git commit] ccid: bump to version 1.4.13
Message-ID: <20131010211037.8040F9A139@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3677f060164dc2f37bfdf860cc140630dbec109
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccid/ccid.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index c25b433..aabc0c0 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.12
+CCID_VERSION = 1.4.13
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
-CCID_SITE = http://alioth.debian.org/frs/download.php/file/3937
+CCID_SITE = http://alioth.debian.org/frs/download.php/file/3959
 CCID_LICENSE = LGPLv2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
