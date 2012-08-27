From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Aug 2012 23:27:18 +0200
Subject: [Buildroot] [git commit] sqlite: add license info
Message-ID: <20120827212737.3541788C09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57f4106c228d997af6e1266f33764eeccefe6977
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 9e63b52..7b5b4aa 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -7,6 +7,7 @@
 SQLITE_VERSION = 3071300
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
+SQLITE_LICENSE = Public domain
 SQLITE_INSTALL_STAGING = YES
 
 ifneq ($(BR2_LARGEFILE),y)
