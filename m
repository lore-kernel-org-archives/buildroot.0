From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 15:34:19 +0200
Subject: [Buildroot] [git commit] bootutils: add license information
Message-ID: <20140709134616.5926D9CF0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f91d9b3585511902c4f241653f310812d22d69a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also add _LICENSE_FILES]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bootutils/bootutils.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
index caee2fd..95d9e50 100644
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -6,7 +6,8 @@
 
 BOOTUTILS_VERSION = 1.0.0
 BOOTUTILS_SITE = http://downloads.sourceforge.net/project/bootutils/Stable/v$(BOOTUTILS_VERSION)
-
 BOOTUTILS_CONF_OPT = --prefix=/ --exec-prefix=/
+BOOTUTILS_LICENSE = GPLv2+
+BOOTUTILS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
