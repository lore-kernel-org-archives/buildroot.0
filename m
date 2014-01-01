From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 Jan 2014 19:03:33 +0100
Subject: [Buildroot] [git commit] minicom: bump to version 2.7
Message-ID: <20140101180525.78C2F9C320@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b60e4b3e75becf82d6e01e5e2176889957af55f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minicom/minicom.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 05004b8..e0a7cee 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 2.6.2
-MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3869/
+MINICOM_VERSION = 2.7
+MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3977/
 MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING
 
