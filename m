From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 13 Jun 2013 15:13:41 +0200
Subject: [Buildroot] [git commit] ltrace: fix download URL
Message-ID: <20130613131727.4D55C9AD61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3f42284904346ba991e87961cfeb4fdd6b98436
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ltrace/ltrace.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 78b5a9d..7b8d859 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTRACE_VERSION = 0.7.2
-LTRACE_SITE = http://alioth.debian.org/frs/download.php/3848
+LTRACE_SITE = http://alioth.debian.org/frs/download.php/file/3848
 LTRACE_SOURCE = ltrace-$(LTRACE_VERSION).tar.bz2
 LTRACE_DEPENDENCIES = libelf
 LTRACE_AUTORECONF = YES
