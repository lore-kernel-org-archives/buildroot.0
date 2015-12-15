From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:04:53 +0100
Subject: [Buildroot] [git commit] setools: comma separate licenses
Message-ID: <20151215210845.2B9CB80409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af6ae670995ae9515b405a0d7179038a1d457727
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/setools/setools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index f575f86..deb421f 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -9,7 +9,7 @@ SETOOLS_SOURCE = setools-$(SETOOLS_VERSION).tar.bz2
 SETOOLS_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/setools3/files/dists/setools-$(SETOOLS_VERSION)
 SETOOLS_DEPENDENCIES = libselinux libsepol sqlite libxml2 bzip2 host-bison host-flex
 SETOOLS_INSTALL_STAGING = YES
-SETOOLS_LICENSE = GPLv2+ LGPLv2.1+
+SETOOLS_LICENSE = GPLv2+, LGPLv2.1+
 SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 
 # configure.ac is patched by the cross compile patch,
