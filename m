From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:59 +0200
Subject: [Buildroot] [PATCH 30/69] mpc: add explicit dependencies for host
	variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-31-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/mpc/mpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index bc26599520fc..579e2ccc1012 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -10,6 +10,7 @@ MPC_LICENSE = LGPLv3+
 MPC_LICENSE_FILES = COPYING.LESSER
 MPC_INSTALL_STAGING = YES
 MPC_DEPENDENCIES = gmp mpfr
+HOST_MPC_DEPENDENCIES = host-gmp host-mpfr
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.0
