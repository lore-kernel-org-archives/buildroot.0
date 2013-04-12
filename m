From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Apr 2013 14:37:43 +0200
Subject: [Buildroot] [git commit] jquery-validation: bump to version 1.11.1
Message-ID: <20130412130253.A9B7D9B5D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f310ee90af3ae1fc9e62b944abf240039b6779df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery-validation/jquery-validation.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 746b534..423d7f1 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -1,6 +1,7 @@
-JQUERY_VALIDATION_VERSION = 1.10.0
+JQUERY_VALIDATION_VERSION = 1.11.1
 JQUERY_VALIDATION_SITE = http://jquery.bassistance.de/validate
 JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
+JQUERY_VALIDATION_LICENSE = MIT
 
 define JQUERY_VALIDATION_EXTRACT_CMDS
 	unzip -d $(@D) $(DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
