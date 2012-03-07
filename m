From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:28 +0100
Subject: [Buildroot] [RFC v2 28/31] berkeleydb: define license
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-29-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/berkeleydb/berkeleydb.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index ed70486..e27f4a9 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -6,6 +6,8 @@
 BERKELEYDB_VERSION:=4.4.20
 BERKELEYDB_SITE:=http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE:=db-$(BERKELEYDB_VERSION).NC.tar.gz
+BERKELEYDB_LICENSE = Sleepycat License
+BERKELEYDB_LICENSE_FILES = LICENSE
 BERKELEYDB_SUBDIR=build_unix
 BERKELEYDB_INSTALL_STAGING = YES
 
-- 
1.7.5.4
