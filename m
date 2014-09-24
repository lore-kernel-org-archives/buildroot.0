From: Avila Risto <Risto.Avila@digia.com>
Date: Wed, 24 Sep 2014 04:37:13 +0000
Subject: [Buildroot] [PATCH 1/1] Unexports MACHINE variable. Fixes bug 7448
Message-ID: <1411533438-1415-1-git-send-email-risto.avila@digia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Risto Avila <risto.avila@digia.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index e788f1b..53f8ad5 100644
--- a/Makefile
+++ b/Makefile
@@ -292,6 +292,7 @@ unexport TAR_OPTIONS
 unexport CONFIG_SITE
 unexport QMAKESPEC
 unexport TERMINFO
+unexport MACHINE
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
-- 
1.9.1
