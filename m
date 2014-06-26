From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:57 -0300
Subject: [Buildroot] [PATCH 29/53] libev: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-29-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libev/libev.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 1742231..11c788d 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -7,5 +7,7 @@
 LIBEV_VERSION = 4.11
 LIBEV_SITE = http://dist.schmorp.de/libev/
 LIBEV_INSTALL_STAGING = YES
+LIBEV_LICENSE = BSD-2c or GPLv2+
+LIBEV_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
-- 
1.8.5.5
