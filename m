From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 13 Jun 2013 14:59:57 +0200
Subject: [Buildroot] [PATCH] ltrace: fix download URL
Message-ID: <1371128397-6011-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>


Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
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
-- 
1.7.5.4
