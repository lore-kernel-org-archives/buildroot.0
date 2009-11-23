From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] sqlite: bump version
Message-ID: <20091123120644.F1CD777782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=89743690740ed0b821c10b4aba93c215504d05f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes various bugs.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/database/sqlite/sqlite.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/database/sqlite/sqlite.mk b/package/database/sqlite/sqlite.mk
index 3375ca9..6d240d5 100644
--- a/package/database/sqlite/sqlite.mk
+++ b/package/database/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3.6.18
+SQLITE_VERSION = 3.6.20
 SQLITE_SOURCE = sqlite-amalgamation-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
-- 
1.6.3.3
