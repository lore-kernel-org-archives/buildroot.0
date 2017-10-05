From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Oct 2017 22:40:31 +0200
Subject: [Buildroot] [git commit] shairport-sync: bump to version 3.1.3
Message-ID: <20171005203341.CCC2780F6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab646bf1628bba83c84f02219759a6461dd18701
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a runtime startup issue on SysV init systems:
```
# shairport-sync -d
Daemon returned 2 as return value.
```

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 35391a8..eac3913 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8c13f7ebbd417e8cab07ea9f74392ced0f54315d8697d4513580f472859a9c65  shairport-sync-3.1.2.tar.gz
+sha256  dd0484d7e8ee7631aee78c78b3762abbdba7ec3f2ee8cd6c1e361544c1414da3  shairport-sync-3.1.3.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 01c1370..acca45c 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.1.2
+SHAIRPORT_SYNC_VERSION = 3.1.3
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
