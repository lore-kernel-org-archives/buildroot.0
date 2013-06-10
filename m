From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Jun 2013 13:22:59 -0300
Subject: [Buildroot] [PATCH] webkit: needs host-ruby
Message-ID: <1370881379-14622-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/13a/13a4ad4622be0c9f395e8c81db2a842b71962f61/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/webkit/webkit.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 9aa8390..116a5e7 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -8,8 +8,8 @@ WEBKIT_VERSION = 1.9.6
 WEBKIT_SITE = http://www.webkitgtk.org/releases
 WEBKIT_SOURCE = webkit-$(WEBKIT_VERSION).tar.xz
 WEBKIT_INSTALL_STAGING = YES
-WEBKIT_DEPENDENCIES = host-flex host-bison host-gperf icu libcurl libxml2 \
-	libxslt libgtk2 sqlite enchant libsoup jpeg libgail
+WEBKIT_DEPENDENCIES = host-ruby host-flex host-bison host-gperf icu libcurl \
+	libxml2 libxslt libgtk2 sqlite enchant libsoup jpeg libgail
 
 # webkit-disable-tests.patch changes configure.ac therefore autoreconf required
 WEBKIT_AUTORECONF = YES
-- 
1.8.1.5
