From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:38 +0100
Subject: [Buildroot] [RFC 05/15] mpc: define license
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/mpc/mpc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index e5ee489..949b111 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -6,6 +6,7 @@
 
 MPC_VERSION = 0.9
 MPC_SITE = http://www.multiprecision.org/mpc/download
+MPC_LICENSE = LGPL_V2.1
 MPC_INSTALL_STAGING = YES
 MPC_DEPENDENCIES = gmp mpfr
 MPC_AUTORECONF = YES
-- 
1.7.5.4
