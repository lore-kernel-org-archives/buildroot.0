From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jun 2013 23:08:05 +0200
Subject: [Buildroot] [git commit] webkit: needs host-ruby
Message-ID: <20130610211339.A53529A5B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01e9002ada3e7d2c7d1559ddec029d79b4f55f51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/13a/13a4ad4622be0c9f395e8c81db2a842b71962f61/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webkit/webkit.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
