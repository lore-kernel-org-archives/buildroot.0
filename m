From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:10:16 -0400
Subject: [Buildroot] [PATCH 06/17] libcurl: add license info
In-Reply-To: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
References: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1344715827-9452-6-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libcurl/libcurl.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index d6882fd..090bb4c 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -7,6 +7,8 @@
 LIBCURL_VERSION = 7.25.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
+LIBCURL_LICENSE = ICS
+LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
 LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols
 
-- 
1.7.9.5
