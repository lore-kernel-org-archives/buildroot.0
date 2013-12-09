From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Dec 2013 09:20:28 +0100
Subject: [Buildroot] [git commit] snappy: bump to version 1.1.1
Message-ID: <20131209082140.E34C99BF73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c703ef5a2c6f61d28cf0001a4cfd9f5be27bc71c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snappy/snappy.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index d8ec239..b94f8cc 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAPPY_VERSION		= 1.1.0
+SNAPPY_VERSION		= 1.1.1
 SNAPPY_SITE		= http://snappy.googlecode.com/files/
 SNAPPY_LICENSE		= BSD-3c
 SNAPPY_LICENSE_FILES	= COPYING
