From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 14:56:12 +0200
Subject: [Buildroot] [git commit] libplatform: use SPDX short identifier for
	PHP license
Message-ID: <20170403125752.659C882675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=414591fcc5f74d678fc241adb0c5f6842a8423e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libplatform/libplatform.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index b253028..d013799 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -6,7 +6,7 @@
 
 LIBPLATFORM_VERSION = feafe68e3e0b02c3261aefb3d711863ef6fadd38
 LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
-LIBPLATFORM_LICENSE = GPL-2.0+, PHP license v3.01
+LIBPLATFORM_LICENSE = GPL-2.0+, PHP-3.01
 LIBPLATFORM_LICENSE_FILES = src/os.h src/util/fstrcmp.c
 LIBPLATFORM_INSTALL_STAGING = YES
 
