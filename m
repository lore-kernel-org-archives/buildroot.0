From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 3 May 2013 12:26:45 +0200
Subject: [Buildroot] [git commit] memtester: add license info
Message-ID: <20130503103546.311DF99A4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9aa7ecb7f7a2a65c2f05eb0c32fb929565a2fd2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/memtester/memtester.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 8cca471..461a906 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -6,6 +6,8 @@
 MEMTESTER_VERSION = 4.3.0
 MEMTESTER_SOURCE = memtester-$(MEMTESTER_VERSION).tar.gz
 MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions/
+MEMTESTER_LICENSE = GPLv2
+MEMTESTER_LICENSE_FILES = COPYING
 
 MEMTESTER_TARGET_INSTALL_OPTS = INSTALLPATH=$(TARGET_DIR)/usr
 
