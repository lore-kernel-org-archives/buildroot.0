From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:33 +0100
Subject: [Buildroot] [git commit] mpc: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224424.661BB9036D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5afc3717c39e00e660cffdd0c3036a2df9d8c79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
