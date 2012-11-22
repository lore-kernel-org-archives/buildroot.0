From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:22 +0100
Subject: [Buildroot] [PATCH 32/33] rrdtool: add license info
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-33-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/rrdtool/rrdtool.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 8799a85..4392b50 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -6,6 +6,9 @@
 
 RRDTOOL_VERSION = 1.2.30
 RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
+RRDTOOL_LICENSE = GPLv2+ with FLOSS license exceptions as explained in COPYRIGHT
+RRDTOOL_LICENSE_FILES = COPYING
+
 RRDTOOL_DEPENDENCIES = host-pkgconf freetype libart libpng zlib
 RRDTOOL_AUTORECONF = YES
 RRDTOOL_INSTALL_STAGING = YES
-- 
1.8.0
