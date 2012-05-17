From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:11 +0200
Subject: [Buildroot] [PATCH v4 12/22] mpc: define license
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-13-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/mpc/mpc.mk |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.9.5
