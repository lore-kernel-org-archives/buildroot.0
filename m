From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 2 Oct 2012 08:48:33 +0200
Subject: [Buildroot] [git commit] fftw: bump version
Message-ID: <20121002065916.6F98899795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2e0d96bc0749381600e85432d36c3699db481b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fftw/fftw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index f846ffc..74a5e11 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFTW_VERSION = 3.3
+FFTW_VERSION = 3.3.2
 FFTW_SITE = http://www.fftw.org
 FFTW_INSTALL_STAGING = YES
 
