From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 15 Nov 2017 12:51:55 +0100
Subject: [Buildroot] [PATCH 2/2] package/feh: Bump to version 2.22.2
In-Reply-To: <20171115115155.4830-1-petr.vorel@gmail.com>
References: <20171115115155.4830-1-petr.vorel@gmail.com>
Message-ID: <20171115115155.4830-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index f3f7ceddd9..0f8ac8c0b0 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 520481c9908d999f8f7546103b78ff9b11f41d25b0938f0a22f10aaa48beef2b  feh-2.21.tar.bz2
+sha256 05a81fbe0997f6274c7617efc351647be38e5244c2624bd203459025c9a68ecd  feh-2.22.2.tar.bz2
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index e0ca21b9ca..5fa6e055d3 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.21
+FEH_VERSION = 2.22.2
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
-- 
2.15.0
