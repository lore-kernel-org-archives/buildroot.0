From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:15 +0100
Subject: [Buildroot] [RFC v2 15/31] mpc: define license
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-16-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/mpc/mpc.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index e5ee489..0a11a52 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -6,6 +6,8 @@
 
 MPC_VERSION = 0.9
 MPC_SITE = http://www.multiprecision.org/mpc/download
+MPC_LICENSE = LGPLv2.1
+MPC_LICENSE_FILES = COPYING.LIB
 MPC_INSTALL_STAGING = YES
 MPC_DEPENDENCIES = gmp mpfr
 MPC_AUTORECONF = YES
-- 
1.7.5.4
