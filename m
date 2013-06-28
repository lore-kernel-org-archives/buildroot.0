From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:35:37 +0200
Subject: [Buildroot] [git commit] fbterm: define license
Message-ID: <20130628195143.995039B290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38f96a6ce2786d2429ffe0ec23c1e6be46024311
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fbterm/fbterm.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
index 6fc4d7f..7e9d324 100644
--- a/package/fbterm/fbterm.mk
+++ b/package/fbterm/fbterm.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 FBTERM_VERSION = 1.7.0
-FBTERM_SITE = http://fbterm.googlecode.com/files/
-
+FBTERM_SITE = http://fbterm.googlecode.com/files
+FBTERM_LICENSE = GPLv2+
+FBTERM_LICENSE_FILES = COPYING
 FBTERM_DEPENDENCIES = fontconfig liberation
 
 $(eval $(autotools-package))
