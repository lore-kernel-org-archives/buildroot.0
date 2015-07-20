From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Jul 2015 19:47:51 +0200
Subject: [Buildroot] [PATCH 03/11] package/wipe: remove autoreconf
In-Reply-To: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
References: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437414479-16714-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A configure script is already bundled in the archive.
There is no comment why autoreconf was added.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
Not sure, to be tested.
---
 package/wipe/wipe.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index 38cb434..9ec7faf 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -7,7 +7,6 @@
 WIPE_VERSION = 2.3.1
 WIPE_SITE = http://downloads.sourceforge.net/project/wipe/wipe/$(WIPE_VERSION)
 WIPE_SOURCE = wipe-$(WIPE_VERSION).tar.bz2
-WIPE_AUTORECONF = YES
 WIPE_LICENSE = GPLv2+
 WIPE_LICENSE_FILES = LICENSE
 
-- 
2.4.3
