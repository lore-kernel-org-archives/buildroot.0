From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:54 -0000
Subject: [Buildroot] [git commit branch/next] orc: remove redundant
	HOST_ORC_DEPENDENCIES
Message-ID: <20120802195249.D1E2E96EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=585a4b0aa6e964fd0dca39aef8feeb72b6bce39c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/orc/orc.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 6602e36..97c80f2 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -7,7 +7,6 @@ ORC_VERSION = 0.4.14
 ORC_SITE = http://code.entropywave.com/download/orc/
 ORC_INSTALL_STAGING = YES
 ORC_DEPENDENCIES = host-orc
-HOST_ORC_DEPENDENCIES =
 
 define ORC_REMOVE_BUGREPORT
 	rm -f $(TARGET_DIR)/usr/bin/orc-bugreport
