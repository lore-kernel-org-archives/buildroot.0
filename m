From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2016 23:09:52 +0100
Subject: [Buildroot] [git commit] libcue: needs host-bison and host-flex
Message-ID: <20160211221019.41FF27FB06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efc4682594a0dbfbd51f781f91cc50aa7a2a97a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/975/975663820e3d4e78e52c11ac3c0535d5537a134a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcue/libcue.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index de8f792..7012453 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -8,7 +8,7 @@ LIBCUE_VERSION = v1.4.0
 LIBCUE_SITE = $(call github,lipnitsk,libcue,$(LIBCUE_VERSION))
 LIBCUE_LICENSE = GPLv2, BSD-2c (rem.c)
 LIBCUE_LICENSE_FILES = COPYING
-LIBCUE_DEPENDENCIES = flex
+LIBCUE_DEPENDENCIES = host-bison host-flex flex
 LIBCUE_INSTALL_STAGING = YES
 LIBCUE_AUTORECONF = YES
 
