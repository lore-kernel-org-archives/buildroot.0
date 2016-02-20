From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 19:20:59 +0100
Subject: [Buildroot] [git commit] erlang-p1-stun: bump to version 0.9.0
Message-ID: <20160302202754.B14F07FF3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86803492ec34ee3cb8f0abad51d3c23e7c5ba906
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
[Thomas:
 - do only the version bump, not the package rename, as suggested by
   Romain Naour
 - erlang-p1-stun continues to depend on erlang-p1-tls, not
   erlang-fast_tls.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-stun/erlang-p1-stun.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
index 7920347..4d26f91 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ b/package/erlang-p1-stun/erlang-p1-stun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STUN_VERSION = a3dce07
+ERLANG_P1_STUN_VERSION = 0.9.0
 ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
 ERLANG_P1_STUN_LICENSE = GPLv2+
 ERLANG_P1_STUN_LICENSE_FILES = COPYING
