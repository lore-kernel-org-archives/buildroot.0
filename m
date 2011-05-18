From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 12:08:24 +0200
Subject: [Buildroot] [PATCH 06/10] pango: bump to 1.28.4
In-Reply-To: <cover.1305713253.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305713253.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8c47f5340604f1c76840ef1423c374d0733236c2.1305713253.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.1
