From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Sep 2016 19:48:29 +0200
Subject: [Buildroot] [git commit] package/fbterm: fix download site
Message-ID: <20160908174926.F0BD4817F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e9292f6e4f27633453f1cc302cb4e4eebe0b387
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fbterm-1.7.0.tar.gz is no more accessible from http://fbterm.googlecode.com/files

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
