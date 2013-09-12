From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 Sep 2013 22:32:23 +0200
Subject: [Buildroot] [git commit] libsoc: strip trailing newline
Message-ID: <20130912203225.98B429B71B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3f42921b5325721d6653a7019a6daa04be64e45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Missing from previous commit.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsoc/libsoc.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index f310266..509d8eb 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -12,4 +12,3 @@ LIBSOC_AUTORECONF = YES
 LIBSOC_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-
