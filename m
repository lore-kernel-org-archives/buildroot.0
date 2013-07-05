From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Jul 2013 10:27:46 +0200
Subject: [Buildroot] [PATCH] eglibc: add license details
Message-ID: <1373012866-3927-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eglibc/eglibc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/eglibc/eglibc.mk b/package/eglibc/eglibc.mk
index bb81757..ccdc210 100644
--- a/package/eglibc/eglibc.mk
+++ b/package/eglibc/eglibc.mk
@@ -7,6 +7,8 @@
 EGLIBC_VERSION = 2.17-svnr22064
 EGLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
 EGLIBC_SOURCE = eglibc-$(EGLIBC_VERSION).tar.bz2
+EGLIBC_LICENSE = GPLv2+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
+EGLIBC_LICENSE_FILES = libc/COPYING libc/COPYING.LIB libc/LICENSES
 
 # Before eglibc is configured, we must have the first stage
 # cross-compiler and the kernel headers
-- 
1.8.1.2
