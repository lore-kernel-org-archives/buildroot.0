From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:17:22 +0200
Subject: [Buildroot] [git commit] mpc: add explicit dependencies for host
	variant
Message-ID: <20160703072403.33F5C81E22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f8f0ec1c5a9191ba391a51479a8fb282c0f78c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpc/mpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index bc26599..579e2cc 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -10,6 +10,7 @@ MPC_LICENSE = LGPLv3+
 MPC_LICENSE_FILES = COPYING.LESSER
 MPC_INSTALL_STAGING = YES
 MPC_DEPENDENCIES = gmp mpfr
+HOST_MPC_DEPENDENCIES = host-gmp host-mpfr
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
