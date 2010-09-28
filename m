From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Sep 2010 00:12:54 +0200
Subject: [Buildroot] [PATCH 3/3] pango: bump version to 1.28.2
In-Reply-To: <cover.1285711882.git.thomas.petazzoni@free-electrons.com>
References: <cover.1285711882.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d6a1e942d6603516bfda1b1af20f8a1dbb3349ad.1285711883.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
