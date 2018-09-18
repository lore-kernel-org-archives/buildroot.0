From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 21:18:15 +0200
Subject: [Buildroot] [git commit] tzdump: bump to version
 e1a52ce12a701b8ea4163d6719713e38c0e53d35
Message-ID: <20180918191947.A8D58884CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=808c3ebfe7a41aaee8c1ed941154964edc382759
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This brings the following changes:

$ git slog 65a10105564801094b18c3fcacf4dde4c44e4ab8..e1a52ce12a701b8ea4163d6719713e38c0e53d35
e1a52ce12a701b8ea4163d6719713e38c0e53d35 Merge pull request #2 from mcpat/master
21764c4bc373dc7f770f9d87d77c5efca50d2733 Wrap timezone abbreviations with angle brackets if required

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tzdump/tzdump.hash | 2 +-
 package/tzdump/tzdump.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tzdump/tzdump.hash b/package/tzdump/tzdump.hash
index 71114e0bed..b0d58c62d3 100644
--- a/package/tzdump/tzdump.hash
+++ b/package/tzdump/tzdump.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  403f22f9c3007a051f9dbccff48b396b8e04eb1afcc8d779e6b3d9b6d971e1fe  tzdump-65a10105564801094b18c3fcacf4dde4c44e4ab8.tar.gz
+sha256  e078ba9bd90cb46368beb3cfef2288194e5edefd53ad9565961a97d1c7d6c59f  tzdump-e1a52ce12a701b8ea4163d6719713e38c0e53d35.tar.gz
diff --git a/package/tzdump/tzdump.mk b/package/tzdump/tzdump.mk
index baad978c4f..f6b6a1a729 100644
--- a/package/tzdump/tzdump.mk
+++ b/package/tzdump/tzdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDUMP_VERSION = 65a10105564801094b18c3fcacf4dde4c44e4ab8
+TZDUMP_VERSION = e1a52ce12a701b8ea4163d6719713e38c0e53d35
 TZDUMP_SITE = $(call github,alexandrebelloni,tzdump,$(TZDUMP_VERSION))
 HOST_TZDUMP_DEPENDENCIES = host-zic
 
