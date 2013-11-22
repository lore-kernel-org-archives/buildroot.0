From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 23:41:15 +0100
Subject: [Buildroot] [git commit branch/next] automake: bump to version 1.14
Message-ID: <20131122230539.3A2579BD9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f2fdc708b8474ab2ef557eee7a52f9dc2756ee7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Needed for the bison 3.0.1 bump.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/automake/automake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 94a84dd..8431174 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOMAKE_VERSION = 1.12.6
+AUTOMAKE_VERSION = 1.14
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPLv2+
