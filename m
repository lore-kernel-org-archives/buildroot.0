From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Oct 2014 19:45:56 +0200
Subject: [Buildroot] [PATCH v2 6/7] package/tvheadend: Bump version to
	current git master
In-Reply-To: <1413222357-8299-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413222357-8299-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413222357-8299-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index e92e12d..5d67bbe 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = ca742e00a7717787351e1a432ca9b41f93369d60
+TVHEADEND_VERSION = ddeb0020c448a61eb3cebfe89117c83719e7d838
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
1.7.10.4
