From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 20 Jan 2015 11:17:29 +0100
Subject: [Buildroot] [PATCH 2/2] qwt: add license information
In-Reply-To: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>
References: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <1421749049-1431-2-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/qwt/qwt.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index d783314f7e40..b843618aa6fe 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -10,6 +10,9 @@ QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
 QWT_DEPENDENCIES = qt
 
+QWT_LICENSE = LGPLv2.1 with exceptions
+QWT_LICENSE_FILES = COPYING
+
 QWT_CONFIG = 's%QWT_INSTALL_PREFIX.*/usr/local/.*%QWT_INSTALL_PREFIX = /usr%'
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDesigner.*$$/\# QWT_CONFIG += QwtDesigner/'
 QWT_CONFIG += -e 's%/features%/mkspecs/features%'
-- 
2.0.0
