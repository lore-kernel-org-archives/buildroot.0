From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 16:09:53 +0100
Subject: [Buildroot] [git commit] lsqlite3: bump to version 0.9.3
Message-ID: <20150202152924.1EDA3800AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef31b974ad9aeb4e9bfd58d54c7a5d7ad471ce9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lsqlite3/lsqlite3.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
index b611d70..db65ae5 100644
--- a/package/lsqlite3/lsqlite3.mk
+++ b/package/lsqlite3/lsqlite3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LSQLITE3_VERSION = 0.9.1-2
-LSQLITE3_SUBDIR = lsqlite3_fsl09t
+LSQLITE3_VERSION = 0.9.3-0
+LSQLITE3_SUBDIR = lsqlite3_fsl09w
 LSQLITE3_DEPENDENCIES = sqlite
 LSQLITE3_LICENSE = MIT
 
