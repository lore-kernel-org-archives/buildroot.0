From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 30 Nov 2012 10:14:39 +0000
Subject: [Buildroot] [PATCH 4/8] gmp: add license information
In-Reply-To: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
References: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
Message-ID: <1354270483-32356-5-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/gmp/gmp.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 5bcc6c1..72673c7 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -8,6 +8,8 @@ GMP_VERSION = 5.0.5
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
+GMP_LICENSE = LGPLv3+
+GMP_LICENSE_FILES = COPYING.LIB
 
 # Bad ARM assembly breaks on pure thumb
 ifeq ($(ARCH),arm)
-- 
1.7.10.4
