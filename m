From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:01:34 +0200
Subject: [Buildroot] [git commit] mpg123: bump to version 1.23.6
Message-ID: <20160630220144.494DA82198@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcd8f6759b48b61dad9e143ec9e0fce61ca42482
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpg123/mpg123.hash | 2 +-
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 6429baa..bf1e8c7 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b658df672813511ff9b68a1553917220b675067204cdb58dbb59a2b8179350b2	mpg123-1.23.5.tar.bz2
+sha256	4073d9c60a43872f6f5a3a322f5ea21ab7f0869d2ed25e79c3eb8521fa3c32d4	mpg123-1.23.6.tar.bz2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 37f207e..2e7bdc5 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.23.5
+MPG123_VERSION = 1.23.6
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
