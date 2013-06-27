From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 10:47:44 +0200
Subject: [Buildroot] [git commit] minicom: fix download URL
Message-ID: <20130627085022.0FFC29AF63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1f483b2c3efe483a058c34ff2b68335f98af3bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #6338

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/minicom/minicom.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 25f266b..f967d87 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -6,7 +6,7 @@
 
 MINICOM_VERSION = 2.6.1
 MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.gz
-MINICOM_SITE = http://alioth.debian.org/frs/download.php/3700/
+MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3700/
 MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING
 
