From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Apr 2013 14:37:54 +0200
Subject: [Buildroot] [git commit] jquery: bump to version 1.9.1
Message-ID: <20130412130253.E71219B5D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39ce56afde956ceaff7134448df759be6e2aae36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery/jquery.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 871f7a0..4df2801 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -1,6 +1,7 @@
-JQUERY_VERSION = 1.8.3
+JQUERY_VERSION = 1.9.1
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
+JQUERY_LICENSE = MIT
 
 define JQUERY_EXTRACT_CMDS
 	cp $(DL_DIR)/$(JQUERY_SOURCE) $(@D)
