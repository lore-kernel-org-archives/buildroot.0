From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:15 -0300
Subject: [Buildroot] [PATCH 18/19] ortp: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-18-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ortp/ortp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index 8983df7..5ccc5ff 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -8,5 +8,7 @@ ORTP_VERSION = 0.20.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
 ORTP_CONF_OPT = --disable-strict
 ORTP_INSTALL_STAGING = YES
+ORTP_LICENSE = LGPLv2.1+
+ORTP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.1.5
