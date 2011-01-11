From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Jan 2011 07:56:22 +0100
Subject: [Buildroot] [git commit master 1/1] webkit: security bump to
	version 1.2.6
Message-ID: <20110111081431.5B06488DEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f99f6aaa79918fe423e5b76f01f708fed2d93ced
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 1.2.6 which includes security fixes for:
CVE-2010-1791, CVE-2010-3812, CVE-2010-3813, CVE-2010-4197,
CVE-2010-4198, CVE-2010-4204 and CVE-2010-4206.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.2.2
