From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:43 -0000
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3200000
	(3.20.0)
Message-ID: <20170902130615.B89A081DA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a608328d1427d7d08a3ca5a5c1545e43bb054196
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index d04abf3..bed2aef 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 58f2cabffb3ff4761a3ac7f834d9db7b46307c1f  sqlite-autoconf-3190300.tar.gz
+sha1 2a451bcf42dc0865840463f7efc3f51cebeb4ea8  sqlite-autoconf-3200000.tar.gz
 # Calculated based on the hash above
-sha256 06129c03dced9f87733a8cba408871bd60673b8f93b920ba8d815efab0a06301  sqlite-autoconf-3190300.tar.gz
+sha256 3814c6f629ff93968b2b37a70497cfe98b366bf587a2261a56a5f750af6ae6a0  sqlite-autoconf-3200000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index f6b249d..1bfa6ca 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3190300
+SQLITE_VERSION = 3200000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2017
 SQLITE_LICENSE = Public domain
