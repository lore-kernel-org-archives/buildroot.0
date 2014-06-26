From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:45 -0300
Subject: [Buildroot] [PATCH 17/53] grantlee: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-17-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/grantlee/grantlee.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index 2ad5888..f5347ae 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -8,5 +8,7 @@ GRANTLEE_VERSION = 0.2.0
 GRANTLEE_SITE = http://downloads.grantlee.org
 GRANTLEE_INSTALL_STAGING = YES
 GRANTLEE_DEPENDENCIES =  qt
+GRANTLEE_LICENSE = LGPLv2.1+
+GRANTLEE_LICENSE_FILES = COPYING.LIB
 
 $(eval $(cmake-package))
-- 
1.8.5.5
