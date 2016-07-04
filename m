From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 4 Jul 2016 18:16:25 +0530
Subject: [Buildroot] [PATCH 5/6] gmp: correct legal info
In-Reply-To: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1467636386-6759-5-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 6, GMP is distributed under the dual licenses LGPLv3+ or
GPLv2+

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/gmp/gmp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index cdde794..485bf7c 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -8,8 +8,8 @@ GMP_VERSION = 6.1.1
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
-GMP_LICENSE = LGPLv3+
-GMP_LICENSE_FILES = COPYING.LESSERv3
+GMP_LICENSE = LGPLv3+ or GPLv2+
+GMP_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
 GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
 
-- 
2.6.2
