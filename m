From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 02 Jun 2013 21:20:47 -0000
Subject: [Buildroot] [git commit] gsl: handle gsl-config script
Message-ID: <20130602212043.A654B9A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a91b976b7c12a46536f12b430b3af4335556a09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gsl/gsl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 6591591..ef426cf 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -9,6 +9,7 @@ GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPLv3
 GSL_LICENSE_FILES = COPYING
+GSL_CONFIG_SCRIPTS = gsl-config
 
 # uClibc pretends to have fenv support as it installs <fenv.h>, but in
 # practice, it only implements it for i386. Problem reported upstream
