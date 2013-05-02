From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 May 2013 23:53:36 +0200
Subject: [Buildroot] [git commit] ccache: define license
Message-ID: <20130502215429.F337F99A15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5f8797b2cfeef0cb8c13a5ebace066813da2893
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ccache/ccache.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 1cbad6e..faa7c9f 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -7,6 +7,8 @@
 CCACHE_VERSION = 3.1.8
 CCACHE_SITE    = http://samba.org/ftp/ccache
 CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.bz2
+CCACHE_LICENSE = GPLv3+, others
+CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
 
 # When ccache is being built for the host, ccache is not yet
 # available, so we have to use the special C compiler without the
