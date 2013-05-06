From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 17:43:36 +0200
Subject: [Buildroot] [git commit] jquery-ui: add license info
Message-ID: <20130506221622.2411999ABA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0421f606f0f3479ea87a302ccc601627067282ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery-ui/jquery-ui.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
index 9e19f13..9375ec2 100644
--- a/package/jquery-ui/jquery-ui.mk
+++ b/package/jquery-ui/jquery-ui.mk
@@ -7,6 +7,8 @@
 JQUERY_UI_VERSION = 1.10.3
 JQUERY_UI_SITE = http://jqueryui.com/resources/download
 JQUERY_UI_SOURCE = jquery-ui-$(JQUERY_UI_VERSION).zip
+JQUERY_UI_LICENSE = MIT
+JQUERY_UI_LICENSE_FILES = MIT-LICENSE.txt
 
 define JQUERY_UI_EXTRACT_CMDS
 	unzip -d $(@D) $(DL_DIR)/$(JQUERY_UI_SOURCE)
