From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2013 23:24:13 +0100
Subject: [Buildroot] [git commit] spice-protocol: bump to version 0.12.6
Message-ID: <20131212225115.EBA8A9BFEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a3311dbe86138ca711966a502f25bc34de28c3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spice-protocol/spice-protocol.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index 62a028d..fda87b6 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_PROTOCOL_VERSION         = 0.12.2
+SPICE_PROTOCOL_VERSION         = 0.12.6
 SPICE_PROTOCOL_SOURCE          = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
 SPICE_PROTOCOL_SITE            = http://www.spice-space.org/download/releases/
 SPICE_PROTOCOL_LICENSE         = BSD-3c
