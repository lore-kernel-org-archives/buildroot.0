From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:19 -0300
Subject: [Buildroot] [PATCH 13/54] libical: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libical/libical.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index cdee006..4025627 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -7,5 +7,7 @@
 LIBICAL_VERSION = 0.48
 LIBICAL_SITE = http://downloads.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
 LIBICAL_INSTALL_STAGING = YES
+LIBICAL_LICENSE = MPLv1.0 or LGPLv2.1
+LIBICAL_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
-- 
1.8.5.5
