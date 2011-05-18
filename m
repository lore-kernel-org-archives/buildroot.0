From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 18:22:42 +0200
Subject: [Buildroot] [git commit] pango: bump to 1.28.4
Message-ID: <20110518180431.0DD0F83564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ffaf13cfbf648dfc067630fe562739dd1624a4b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 0556896..1ccda5f 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 PANGO_VERSION_MAJOR = 1.28
-PANGO_VERSION_MINOR = 2
+PANGO_VERSION_MINOR = 4
 PANGO_VERSION = $(PANGO_VERSION_MAJOR).$(PANGO_VERSION_MINOR)
 
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.bz2
-- 
1.7.3.4
