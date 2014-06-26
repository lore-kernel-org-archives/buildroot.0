From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:16 -0300
Subject: [Buildroot] [PATCH 48/53] thttpd: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-48-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/thttpd/thttpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index f4797fa..7be264a 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -8,6 +8,8 @@ THTTPD_VERSION = 2.25b
 THTTPD_SOURCE = thttpd_$(THTTPD_VERSION).orig.tar.gz
 THTTPD_PATCH = thttpd_$(THTTPD_VERSION)-11.diff.gz
 THTTPD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/t/thttpd/
+THTTPD_LICENSE = BSD-2c
+THTTPD_LICENSE_FILES = thttpd.c
 
 ifneq ($(THTTPD_PATCH),)
 define THTTPD_DEBIAN_PATCHES
-- 
1.8.5.5
