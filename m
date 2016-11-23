From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 13:58:57 +0100
Subject: [Buildroot] [PATCH v4 18/18] reproducible: fix coding style
In-Reply-To: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479905937-17241-19-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
Notes:
   v3:
     - New patch (Arnout)

 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 819c8df..d965304 100644
--- a/Makefile
+++ b/Makefile
@@ -248,9 +248,9 @@ endif
 
 # timezone and locale may affect build output
 ifeq ($(BR2_REPRODUCIBLE),y)
-export TZ=UTC
-export LANG=C
-export LC_ALL=C
+export TZ = UTC
+export LANG = C
+export LC_ALL = C
 export GZIP = -n
 BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
 export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
-- 
1.9.1
