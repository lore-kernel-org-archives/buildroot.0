From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Fri, 31 Mar 2017 09:39:44 +0200
Subject: [Buildroot] [PATCH] dc3dd: upcase the autoreconf value
Message-ID: <1490945984-26997-1-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
 package/dc3dd/dc3dd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
index fef9093..2830bb2 100644
--- a/package/dc3dd/dc3dd.mk
+++ b/package/dc3dd/dc3dd.mk
@@ -11,6 +11,6 @@ DC3DD_SITE = https://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSI
 DC3DD_LICENSE = GPLv3+
 DC3DD_LICENSE_FILES = COPYING
 # We are patching the Makefile.am
-DC3DD_AUTORECONF = yes
+DC3DD_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.1.4
