From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:06:04 +0200
Subject: [Buildroot] [PATCH 31/41] webkit: drop target installation option
	(it's on by default)
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-32-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/webkit/webkit.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 0402f9a..a3ba690 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -8,7 +8,6 @@ WEBKIT_SOURCE = WebKit-$(WEBKIT_VERSION).tar.bz2
 WEBKIT_SITE = http://nightly.webkit.org/files/trunk/src/
 
 WEBKIT_INSTALL_STAGING = YES
-WEBKIT_INSTALL_TARGET = YES
 WEBKIT_LIBTOOL_PATCH = NO
 
 WEBKIT_DEPENDENCIES = host-flex host-gperf icu curl libxml2 libxslt	\
-- 
1.7.0.4
