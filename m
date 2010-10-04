From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Oct 2010 09:08:08 +0200
Subject: [Buildroot] [git commit master 1/1] lighttpd: bump version
Message-ID: <20101004071614.2CC328B8B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=489e2b803e9ef362cbc4fef675459a6a781bb16a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lighttpd/lighttpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index e6f913c..7d8708a 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIGHTTPD_VERSION = 1.4.26
+LIGHTTPD_VERSION = 1.4.28
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
 LIGHTTPD_LIBTOOL_PATCH = NO
 
-- 
1.7.1
