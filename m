From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 22:00:18 +0100
Subject: [Buildroot] [git commit] agentpp: update URL address
Message-ID: <20150303212044.264B380DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a30d7b0741e910ef9044852068af445f6296363
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/agentpp/agentpp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 3d95ff4..29d809e 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -6,7 +6,7 @@
 
 AGENTPP_VERSION = 4.0.3
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
-AGENTPP_SITE = http://www.agentpp.com
+AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
 AGENTPP_LICENSE_FILES = LICENSE-2_0.txt
 AGENTPP_INSTALL_STAGING = YES
