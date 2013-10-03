From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Oct 2013 22:10:26 +0200
Subject: [Buildroot] [git commit] empty: bump to version 0.6.19b
Message-ID: <20131003215306.C81089B831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d60e9e3f2a335f32728aabdc58a6476541aee7e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/empty/empty.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 4294777..3339ff6 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EMPTY_VERSION = 0.6.18b
+EMPTY_VERSION = 0.6.19b
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
 EMPTY_LICENSE = BSD-3c
