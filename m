From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:04:05 +0100
Subject: [Buildroot] [git commit] iputils: comma separate licenses
Message-ID: <20151215210844.C108780409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa3914d656e817c6805448be49ebd31f1c05b043
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 332e20f..7510d99 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -7,7 +7,7 @@
 IPUTILS_VERSION = s20121011
 IPUTILS_SITE = http://www.skbuff.net/iputils
 IPUTILS_SOURCE = iputils-$(IPUTILS_VERSION).tar.bz2
-IPUTILS_LICENSE = GPLv2+ BSD-3c
+IPUTILS_LICENSE = GPLv2+, BSD-3c
 # Only includes a license file for BSD
 IPUTILS_LICENSE_FILES = ninfod/COPYING
 IPUTILS_DEPENDENCIES = openssl
