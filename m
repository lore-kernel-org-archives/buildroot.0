From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 22:08:02 +0200
Subject: [Buildroot] [git commit] minicom: bump to version 2.6.2
Message-ID: <20131007201927.B2E759B97C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4a389324cf3b018b9eb29e0b21d2711098edb01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minicom/minicom.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index d46376e..05004b8 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 2.6.1
-MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3700/
+MINICOM_VERSION = 2.6.2
+MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3869/
 MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING
 
