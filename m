From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:48:09 +0200
Subject: [Buildroot] [git commit] libical: add license information
Message-ID: <20140625211213.DBFD29D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b4aa0894ebcf693b91f29dc01cedc0fc5f79c24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libical/libical.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index cdee006..4025627 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -7,5 +7,7 @@
 LIBICAL_VERSION = 0.48
 LIBICAL_SITE = http://downloads.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
 LIBICAL_INSTALL_STAGING = YES
+LIBICAL_LICENSE = MPLv1.0 or LGPLv2.1
+LIBICAL_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
