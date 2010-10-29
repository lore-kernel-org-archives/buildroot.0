From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Oct 2010 20:06:24 +0200
Subject: [Buildroot] [git commit master 1/1] pango: bump version to 1.28.2
Message-ID: <20101029181143.841FE8D41D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=493c54b9c252ce1ed7305f5186b8ec940a7e2314
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a mechanical bump, no other changes involved.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index dc04b55..373eb8b 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 PANGO_VERSION_MAJOR = 1.28
-PANGO_VERSION_MINOR = 0
+PANGO_VERSION_MINOR = 2
 PANGO_VERSION = $(PANGO_VERSION_MAJOR).$(PANGO_VERSION_MINOR)
 
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.bz2
-- 
1.7.1
