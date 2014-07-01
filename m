From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:24:31 +0200
Subject: [Buildroot] [git commit] grantlee: add license information
Message-ID: <20140701224921.A486E9D132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d9d7a208cf233a2a3bd71ebce05417b6fb1640c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grantlee/grantlee.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index 2ad5888..f5347ae 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -8,5 +8,7 @@ GRANTLEE_VERSION = 0.2.0
 GRANTLEE_SITE = http://downloads.grantlee.org
 GRANTLEE_INSTALL_STAGING = YES
 GRANTLEE_DEPENDENCIES =  qt
+GRANTLEE_LICENSE = LGPLv2.1+
+GRANTLEE_LICENSE_FILES = COPYING.LIB
 
 $(eval $(cmake-package))
