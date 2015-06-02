From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 16:05:26 +0200
Subject: [Buildroot] [git commit] sqlite: bump to version 3.8.10.2
Message-ID: <20150602140551.532CD8190D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0c6a2f866e428e5de3e04f6edcfd78304e0d742
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash |    2 +-
 package/sqlite/sqlite.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index d524dbe..85e9709 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1	7e92b4f78d4648fb2a97a4dc721490cc08653a0b	sqlite-autoconf-3081000.tar.gz
+sha1	c2f2c17d3dc4c4e179d35cc04e4420636d48a152	sqlite-autoconf-3081002.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index b2283f0..9aac8e6 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3081000
+SQLITE_VERSION = 3081002
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
