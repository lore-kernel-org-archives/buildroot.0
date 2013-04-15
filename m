From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 15 Apr 2013 08:54:15 +0100
Subject: [Buildroot] [PATCH] madplay: add license information
Message-ID: <1366012456-507-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/multimedia/madplay/madplay.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/multimedia/madplay/madplay.mk b/package/multimedia/madplay/madplay.mk
index e80726c..d68c86b 100644
--- a/package/multimedia/madplay/madplay.mk
+++ b/package/multimedia/madplay/madplay.mk
@@ -7,6 +7,8 @@
 MADPLAY_VERSION = 0.15.2b
 MADPLAY_SOURCE = madplay-$(MADPLAY_VERSION).tar.gz
 MADPLAY_SITE = http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VERSION)
+MADPLAY_LICENSE = GPLv2+
+MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
 MADPLAY_LIBTOOL_PATCH = NO
 MADPLAY_DEPENDENCIES = libmad libid3tag
 
-- 
1.7.10.4
