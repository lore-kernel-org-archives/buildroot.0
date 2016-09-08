From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu,  8 Sep 2016 14:43:43 +0200
Subject: [Buildroot] [PATCH] package/fbterm: fix download site
Message-ID: <1473338623-14693-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

fbterm-1.7.0.tar.gz is no more accessible from http://fbterm.googlecode.com/files

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 package/fbterm/fbterm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
index 7a424a5..be3cbe2 100644
--- a/package/fbterm/fbterm.mk
+++ b/package/fbterm/fbterm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FBTERM_VERSION = 1.7.0
-FBTERM_SITE = http://fbterm.googlecode.com/files
+FBTERM_SITE = https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/fbterm
 FBTERM_LICENSE = GPLv2+
 FBTERM_LICENSE_FILES = COPYING
 FBTERM_DEPENDENCIES = fontconfig liberation
-- 
2.1.4
