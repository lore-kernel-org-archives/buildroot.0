From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 30 Nov 2012 22:46:33 +0100
Subject: [Buildroot] [PATCH v2] rrdtool: add license info
In-Reply-To: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
References: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1354311995-21598-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
v2: fix license according to Arnout's and Baruch's comments
---
 package/rrdtool/rrdtool.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 7521aba..d3b63ea 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -6,6 +6,9 @@
 
 RRDTOOL_VERSION = 1.2.30
 RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
+RRDTOOL_LICENSE = GPLv2+ with FLOSS license exceptions as explained in COPYRIGHT
+RRDTOOL_LICENSE_FILES = COPYING COPYRIGHT
+
 RRDTOOL_DEPENDENCIES = host-pkgconf freetype libart libpng zlib
 RRDTOOL_AUTORECONF = YES
 RRDTOOL_INSTALL_STAGING = YES
-- 
1.8.0.1
