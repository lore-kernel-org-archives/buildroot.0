From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 24 Sep 2016 17:56:30 -0300
Subject: [Buildroot] [PATCH] mpg123: bump to version 1.23.7
Message-ID: <1474750590-11112-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpg123/mpg123.hash | 2 +-
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index bf1e8c7..66a80ac 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	4073d9c60a43872f6f5a3a322f5ea21ab7f0869d2ed25e79c3eb8521fa3c32d4	mpg123-1.23.6.tar.bz2
+sha256	934047120953159e364c790e059684b681d7e670884fe179e1954d17d1c6334b	mpg123-1.23.7.tar.bz2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 2e7bdc5..b14efe7 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.23.6
+MPG123_VERSION = 1.23.7
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
-- 
2.7.3
