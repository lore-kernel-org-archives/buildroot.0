From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 23:22:21 +0100
Subject: [Buildroot] [git commit] sqlite: add license file
Message-ID: <20151125222250.5778A81EFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d644777683abdc2a6fad8c662ed86f719cf1b21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Rosin <peda@axentia.se>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index d08e933..0758fe9 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -8,6 +8,7 @@ SQLITE_VERSION = 3090200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
+SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_INSTALL_STAGING = YES
 
 # Patching Makefile.am:
