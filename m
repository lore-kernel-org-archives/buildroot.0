From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Apr 2015 15:07:55 +0200
Subject: [Buildroot] [git commit] package/shairport-sync: bump to version
	2.2.3
Message-ID: <20150422131028.C9B197FB22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3230923e62f57cdefa90b5ffb9760f39c94718e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shairport-sync/shairport-sync.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 9b85f1d..bfcdb35 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.2.1
+SHAIRPORT_SYNC_VERSION = 2.2.3
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
