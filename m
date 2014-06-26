From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:00 -0300
Subject: [Buildroot] [PATCH 32/53] libmbus: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-32-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmbus/libmbus.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index 93fe95f..6298543 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -7,5 +7,7 @@
 LIBMBUS_VERSION = 0.8.0
 LIBMBUS_SITE = http://www.rscada.se/public-dist/
 LIBMBUS_INSTALL_STAGING = YES
+LIBMBUS_LICENSE = BSD-3c
+LIBMBUS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5
