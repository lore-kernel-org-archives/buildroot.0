From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:03:43 +0100
Subject: [Buildroot] [git commit] keyutils: comma separate licenses
Message-ID: <20151215210844.98AE3818FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08bb652234f6d61f5344c48b0b1dad7747fc9b0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/keyutils/keyutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 3d6697e..7a30ba6 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -7,7 +7,7 @@
 KEYUTILS_VERSION = 1.5.9
 KEYUTILS_SOURCE = keyutils-$(KEYUTILS_VERSION).tar.bz2
 KEYUTILS_SITE = http://people.redhat.com/~dhowells/keyutils
-KEYUTILS_LICENSE = GPLv2+ LGPLv2.1+
+KEYUTILS_LICENSE = GPLv2+, LGPLv2.1+
 KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
 KEYUTILS_INSTALL_STAGING = YES
 
