From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 15:27:04 +0100
Subject: [Buildroot] [git commit] mpg132: bump to version 1.18.0
Message-ID: <20140204142939.F2AF89C211@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f628dc41ab30df314c872a69ebb2e255e340c22a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a couple of buffer overflows so it should be considered as a
security bump (no CVEs though).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 70d3ed6..a950813 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.17.0
+MPG123_VERSION = 1.18.0
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --disable-lfs-alias
