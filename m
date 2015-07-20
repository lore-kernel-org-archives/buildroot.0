From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Jul 2015 19:47:55 +0200
Subject: [Buildroot] [PATCH 07/11] package/libdvbsi: remove autoreconf
In-Reply-To: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
References: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437414479-16714-7-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A configure script is bundled with the archive
of the current version.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libdvbsi/libdvbsi.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libdvbsi/libdvbsi.mk b/package/libdvbsi/libdvbsi.mk
index ed8b382..f6469f9 100644
--- a/package/libdvbsi/libdvbsi.mk
+++ b/package/libdvbsi/libdvbsi.mk
@@ -11,7 +11,4 @@ LIBDVBSI_INSTALL_STAGING = YES
 LIBDVBSI_LICENSE = LGPLv2.1
 LIBDVBSI_LICENSE_FILES = COPYING
 
-# sometimes no Makefile is in the archive, just (re)generate
-LIBDVBSI_AUTORECONF = YES
-
 $(eval $(autotools-package))
-- 
2.4.3
