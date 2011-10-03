From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon,  3 Oct 2011 23:20:43 +0200
Subject: [Buildroot] [PATCH 07/22] mpc: removed redundant
	HOST_FOO_DEPENDENCIES
In-Reply-To: <1317676858-3407-1-git-send-email-arnout@mind.be>
References: <201110032133.44496.arnout@mind.be>
 <1317676858-3407-1-git-send-email-arnout@mind.be>
Message-ID: <1317676858-3407-8-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mpc/mpc.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 608c9f4..e5ee489 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -10,7 +10,6 @@ MPC_INSTALL_STAGING = YES
 MPC_DEPENDENCIES = gmp mpfr
 MPC_AUTORECONF = YES
 HOST_MPC_AUTORECONF = YES
-HOST_MPC_DEPENDENCIES = host-gmp host-mpfr
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.6.3
