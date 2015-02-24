From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Feb 2015 15:27:32 +0100
Subject: [Buildroot] [git commit branch/next] odhcp6c: bump version for
	IA_NA/IA_PD fix
Message-ID: <20150225161643.06099817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f05e1a302af8a0e9708aa1d4415349986f44995c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/odhcp6c/odhcp6c.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index db963e0..520eaf2 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ODHCP6C_VERSION = c42e34111e19bd435dc4b5bb3ba81224ea214314
+ODHCP6C_VERSION = 8d9b60fb496000988f3633951f2e30380fc2de50
 ODHCP6C_SITE = $(call github,sbyx,odhcp6c,$(ODHCP6C_VERSION))
 ODHCP6C_LICENSE = GPLv2
 ODHCP6C_LICENSE_FILES = COPYING
