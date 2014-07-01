From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:19:51 +0200
Subject: [Buildroot] [git commit] fis: add license information
Message-ID: <20140701224921.87EFB9D133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69b6ab8633d9cec8282b4a0a576af83569c6ccc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fis/fis.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index e9426a1..876b127 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -7,6 +7,8 @@
 FIS_SITE = http://svn.chezphil.org/utils/trunk
 FIS_SITE_METHOD = svn
 FIS_VERSION = 2892
+FIS_LICENSE = GPLv2+
+FIS_LICENSE_FILES = fis.c
 
 define FIS_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) -std=c99 -o $(@D)/fis \
