From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:42 +0100
Subject: [Buildroot] [PATCH 11/39] autoconf: bump version to 2.65
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <169403079a10a783cce02b00ae8adf5509dfc04a.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autoconf/autoconf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index a94f23e..d82c2c5 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -3,7 +3,7 @@
 # autoconf
 #
 #############################################################
-AUTOCONF_VERSION = 2.64
+AUTOCONF_VERSION = 2.65
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.bz2
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-- 
1.6.3.3
