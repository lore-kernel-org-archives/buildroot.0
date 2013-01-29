From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 Jan 2013 23:23:44 +0100
Subject: [Buildroot] [git commit] libmpd: add license information
Message-ID: <20130129223112.9BC6B9A88E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=563ffadac1d1d86d81f607b7420cad637b515b32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmpd/libmpd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
index a2b9d56..9b4a1ed 100644
--- a/package/libmpd/libmpd.mk
+++ b/package/libmpd/libmpd.mk
@@ -8,5 +8,7 @@ LIBMPD_VERSION = 11.8.17
 LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8.16
 LIBMPD_INSTALL_STAGING = YES
 LIBMPD_DEPENDENCIES = libglib2
+LIBMPD_LICENSE = GPLv2+
+LIBMPD_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
