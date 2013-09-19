From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 21:44:00 +0200
Subject: [Buildroot] [git commit] automake: bump to version 1.12.6
Message-ID: <20130919195156.A569B9B7D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e0bc0f3a7b35ba533d5c72387d3b32fab77ac41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/automake/automake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index ab4a1ac..94a84dd 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOMAKE_VERSION = 1.11.6
+AUTOMAKE_VERSION = 1.12.6
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPLv2+
