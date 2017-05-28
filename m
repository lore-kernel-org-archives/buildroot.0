From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 14:56:03 +0200
Subject: [Buildroot] [git commit] package/emlog: bump version to 0.60
Message-ID: <20170601202857.EB02582641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7ca77b8c7d8fe225abe71199e15e37e6dc6e199
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/emlog/emlog.hash | 2 +-
 package/emlog/emlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/emlog/emlog.hash b/package/emlog/emlog.hash
index e946917..9d81d47 100644
--- a/package/emlog/emlog.hash
+++ b/package/emlog/emlog.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 0d82f06301b8486c54e5e36f304d5a83c2347c23b93c1344eacb0b5b3044485a  emlog-576a6c0fcf76dfeff48124b2f5fc0b4207d88ca1.tar.gz
+sha256 9f791a00c86215306597b761ef5c5ad267efee5f01efbe23cfcc04e583aa402d  emlog-emlog-0.60.tar.gz
diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
index 70d133a..e0926e6 100644
--- a/package/emlog/emlog.mk
+++ b/package/emlog/emlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EMLOG_VERSION = 576a6c0fcf76dfeff48124b2f5fc0b4207d88ca1
+EMLOG_VERSION = emlog-0.60
 EMLOG_SITE = $(call github,nicupavel,emlog,$(EMLOG_VERSION))
 EMLOG_LICENSE = GPL-2.0
 EMLOG_LICENSE_FILES = COPYING
