From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 10:53:23 +0200
Subject: [Buildroot] [git commit] python-numpy: remove duplicate BR2_sh in
	dependencies
Message-ID: <20140718085406.6682A9D27A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bef732889c0fe01d6433d5a166cd6352b30c24b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-numpy/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 3145350..1f9938a 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_NUMPY
 	# Numpy has some CPU specific code
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
-		|| BR2_sh || BR2_sh || BR2_x86_64
+		|| BR2_sh || BR2_x86_64
 	# numpy needs fenv.h. Available for all architectures in
 	# glibc, but only for x86 and x86-64 in uClibc.
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_i386 || BR2_x86_64
