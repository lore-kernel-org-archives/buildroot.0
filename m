From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2021 10:35:09 +0100
Subject: [Buildroot] [git commit] package/shairport-sync: bump to version
 3.3.7
Message-ID: <20210113091841.13507876AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f07dff21329839279ab20cae8406fb012e32f3c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 280090cc46..c451edb933 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a8382affd25c473fa38ead5690148c6c3902098f359f9c881eefe139e1f49f49  shairport-sync-3.3.6.tar.gz
+sha256  7f8d4ecec53f2f681a962467bf09205568fc936c8c31a9ee07b1bd72d3d95b12  shairport-sync-3.3.7.tar.gz
 sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 10348d7b55..1a02186dc1 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.3.6
+SHAIRPORT_SYNC_VERSION = 3.3.7
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
