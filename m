From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:56 +0100
Subject: [Buildroot] [git commit] orc: unbreak host build after
	auto-host-deps change
Message-ID: <20120118150408.3A2F49036E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7adabb75c78ed4624aa331cdaffebe716ed38602
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/orc/orc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 97c80f2..6602e36 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -7,6 +7,7 @@ ORC_VERSION = 0.4.14
 ORC_SITE = http://code.entropywave.com/download/orc/
 ORC_INSTALL_STAGING = YES
 ORC_DEPENDENCIES = host-orc
+HOST_ORC_DEPENDENCIES =
 
 define ORC_REMOVE_BUGREPORT
 	rm -f $(TARGET_DIR)/usr/bin/orc-bugreport
