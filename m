From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:55 -0300
Subject: [Buildroot] [PATCH 49/54] gqview: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-49-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gqview/gqview.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index 07cb5ad..8962025 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -8,5 +8,7 @@ GQVIEW_VERSION = 2.1.5
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
 GQVIEW_DEPENDENCIES = host-pkgconf libgtk2
 GQVIEW_CONF_ENV = LIBS="-lm"
+GQVIEW_LICENSE = GPLv2
+GQVIEW_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5
