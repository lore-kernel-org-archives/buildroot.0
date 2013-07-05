From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Jul 2013 10:32:36 +0200
Subject: [Buildroot] [git commit] eglibc: add license details
Message-ID: <20130705083532.4FD1F90AC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=885449e4b9171283a8106957db5cf6139ef2273a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/eglibc/eglibc.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
