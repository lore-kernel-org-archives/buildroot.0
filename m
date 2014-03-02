From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 14:53:59 +0100
Subject: [Buildroot] [git commit] jquery-ui: bump to version 1.10.4
Message-ID: <20140302135433.4A504828EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c82cf6b73eb6a774e52cb9468c4ebc90cf4b55f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jquery-ui/jquery-ui.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
index 6524c40..5eadf53 100644
--- a/package/jquery-ui/jquery-ui.mk
+++ b/package/jquery-ui/jquery-ui.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_UI_VERSION = 1.10.3
+JQUERY_UI_VERSION = 1.10.4
 JQUERY_UI_SITE = http://jqueryui.com/resources/download
 JQUERY_UI_SOURCE = jquery-ui-$(JQUERY_UI_VERSION).zip
 JQUERY_UI_LICENSE = MIT
