From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:54:58 -0000
Subject: [Buildroot] [git commit branch/next] mpc: define license
Message-ID: <20120802195251.C2BAD8D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd9135e72ad83b752fd3d93a96076d0879ed9e9b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpc/mpc.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index e5ee489..5ad47a9 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -6,6 +6,8 @@
 
 MPC_VERSION = 0.9
 MPC_SITE = http://www.multiprecision.org/mpc/download
+MPC_LICENSE = LGPLv2.1+
+MPC_LICENSE_FILES = COPYING.LIB
 MPC_INSTALL_STAGING = YES
 MPC_DEPENDENCIES = gmp mpfr
 MPC_AUTORECONF = YES
