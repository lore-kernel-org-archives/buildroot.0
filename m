From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 21:39:14 +0200
Subject: [Buildroot] [git commit branch/next] fftw: bump to version 3.3.3
Message-ID: <20130512194314.1301C9A0CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7893840d16419e5795bd6b8cbc3adf5a99d9298f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fftw/fftw.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 74a5e11..d0af752 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-FFTW_VERSION = 3.3.2
+FFTW_VERSION = 3.3.3
 FFTW_SITE = http://www.fftw.org
 FFTW_INSTALL_STAGING = YES
+FFTW_LICENSE = GPLv2+
+FFTW_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
