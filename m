From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Dec 2013 20:15:20 -0000
Subject: [Buildroot] [git commit] cifs-utils: bump to version 6.2
Message-ID: <20131201201518.A74D89BE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8552d8cd8fa6b4ebd314d97e45b522e93ef0a620
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cifs-utils/cifs-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index f715e36..4115d4e 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.1
+CIFS_UTILS_VERSION = 6.2
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPLv3+
