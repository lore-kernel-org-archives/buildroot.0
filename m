From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Jan 2011 14:41:23 -0300
Subject: [Buildroot] [PATCH 2/4] webkit: security bump to version 1.2.6
In-Reply-To: <1294681285-1205-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294681285-1205-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294681285-1205-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 1.2.6 which includes security fixes for:
CVE-2010-1791, CVE-2010-3812, CVE-2010-3813, CVE-2010-4197,
CVE-2010-4198, CVE-2010-4204 and CVE-2010-4206.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/webkit/webkit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 7a5429c..6ab609b 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-WEBKIT_VERSION = 1.2.5
+WEBKIT_VERSION = 1.2.6
 WEBKIT_SITE = http://www.webkitgtk.org
 WEBKIT_INSTALL_STAGING = YES
 WEBKIT_DEPENDENCIES = host-flex host-gperf icu libcurl libxml2 libxslt \
-- 
1.7.3.4
