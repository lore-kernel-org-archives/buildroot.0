From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 18:59:18 +0100
Subject: [Buildroot] [git commit] package/libtasn1: Fix GNU Mirror Path
Message-ID: <20170206181456.36ADB81DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ec6172671ef7eff3972cd1b5c8dcdb066bb8fa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replacing ftpmirror.gnu.org with BR2_GNU_MIRROR variable

Signed-off-by: Brian 'redbeard' Harrington <redbeard@coreos.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtasn1/libtasn1.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 79223a4..ac99868 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBTASN1_VERSION = 4.9
-LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
+LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+ (tests, tools), LGPLv2.1+ (library)
 LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
