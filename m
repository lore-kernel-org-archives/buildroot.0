From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Jun 2013 08:47:40 +0200
Subject: [Buildroot] [git commit] orc: add license info
Message-ID: <20130604065154.B82649A5C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33d03591f7d3b7d596f57ec51eeb3f32a6533f77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is mix of BSD-2c and BSD-3c]
Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/orc/orc.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 77cb29f..fef1117 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -5,6 +5,8 @@
 #############################################################
 ORC_VERSION = 0.4.16
 ORC_SITE = http://code.entropywave.com/download/orc/
+ORC_LICENSE = BSD-2c, BSD-3c
+ORC_LICENSE_FILES = COPYING
 ORC_INSTALL_STAGING = YES
 ORC_DEPENDENCIES = host-orc
 
