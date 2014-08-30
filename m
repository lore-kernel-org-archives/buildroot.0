From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Aug 2014 09:08:14 +0200
Subject: [Buildroot] [git commit branch/next] package/libao: bump to version
	1.2.0
Message-ID: <20140830071153.5CB699D573@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c8fa4dbbc919a7da34139bc9ce8edf35d75473a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libao/libao.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index 3f7d166..e966ef2 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAO_VERSION = 1.1.0
+LIBAO_VERSION = 1.2.0
 LIBAO_SITE = http://downloads.xiph.org/releases/ao
 LIBAO_DEPENDENCIES = host-pkgconf
 LIBAO_INSTALL_STAGING = YES
