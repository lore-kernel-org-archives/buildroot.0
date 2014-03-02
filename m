From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 14:54:06 +0100
Subject: [Buildroot] [git commit] jquery-ui-themes: bump to version 1.10.4
Message-ID: <20140302135433.4E6659B9F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5e1d7d1eaac62bc54a2af86490d5161338970d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jquery-ui-themes/jquery-ui-themes.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jquery-ui-themes/jquery-ui-themes.mk b/package/jquery-ui-themes/jquery-ui-themes.mk
index 2ba6801..269ef69 100644
--- a/package/jquery-ui-themes/jquery-ui-themes.mk
+++ b/package/jquery-ui-themes/jquery-ui-themes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_UI_THEMES_VERSION = 1.10.3
+JQUERY_UI_THEMES_VERSION = 1.10.4
 JQUERY_UI_THEMES_SITE = http://jqueryui.com/resources/download
 JQUERY_UI_THEMES_SOURCE = jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION).zip
 JQUERY_UI_THEMES_LICENSE = MIT
