From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 16:48:56 +0100
Subject: [Buildroot] [git commit] agentpp: bump to 4.0.3
Message-ID: <20150123155105.99B0E80E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=818f5865e687e558b39643252d9c761da87b2cb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/agentpp/agentpp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index a1edbb0..3d95ff4 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.0.2
+AGENTPP_VERSION = 4.0.3
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com
 AGENTPP_LICENSE = Apache-2.0
