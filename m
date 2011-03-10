From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2011 10:44:34 -0300
Subject: [Buildroot] [PATCH 4/5] webkit: bump to version 1.2.7
In-Reply-To: <1299764675-23308-1-git-send-email-gustavo@zacarias.com.ar>
References: <1299764675-23308-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1299764675-23308-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/webkit/webkit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 6ab609b..f764eea 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-WEBKIT_VERSION = 1.2.6
+WEBKIT_VERSION = 1.2.7
 WEBKIT_SITE = http://www.webkitgtk.org
 WEBKIT_INSTALL_STAGING = YES
 WEBKIT_DEPENDENCIES = host-flex host-gperf icu libcurl libxml2 libxslt \
-- 
1.7.3.4
