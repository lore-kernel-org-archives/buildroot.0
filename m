From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 21:44:02 +0100
Subject: [Buildroot] [git commit branch/next] xerces: enable parallel builds
Message-ID: <20160229204407.1285D80ACD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05429cb4e0127fd45242a51c6a0ccb278dbce378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It seems to be in place for historical reasons since it seems to build
just fine on my test rigs.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xerces/xerces.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index cf36183..92b0b70 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -9,7 +9,6 @@ XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
-XERCES_MAKE = $(MAKE1)
 XERCES_INSTALL_STAGING = YES
 XERCES_CONF_OPTS = \
 	--disable-threads \
