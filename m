From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 23:31:16 +0100
Subject: [Buildroot] [git commit] tar: add license information
Message-ID: <20130128223359.78AB381D2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fab45efd155c3ec980dccf26f4e842fc71adcc3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tar/tar.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index c1e625f..e465bfa 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -6,6 +6,8 @@
 
 TAR_VERSION = 1.26
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
+TAR_LICENSE = GPLv3+
+TAR_LICENSE_FILES = COPYING
 
 # Prefer full-blown tar over buybox's version
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
