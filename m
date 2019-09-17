From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 16 Sep 2019 22:58:15 -0500
Subject: [Buildroot] [PATCH v2 2/2] package/fakeroot: cleaned up
 check-package git format warning
In-Reply-To: <20190917035815.1750-1-matthew.weber@rockwellcollins.com>
References: <20190917035815.1750-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190917035815.1750-2-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0002-communicate-check-return-status-of-msgrcv.patch
generate your patches with 'git format-patch -N'

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 .../0002-communicate-check-return-status-of-msgrcv.patch        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch b/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch
index 3bb4f9701f..4e81b49122 100644
--- a/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch
+++ b/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch
@@ -1,7 +1,7 @@
 From a853f21633693f9eefc4949660253a5328d2d2f3 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Date: Sun, 13 Aug 2017 23:21:54 +0200
-Subject: [PATCH 1/1] communicate: check return status of msgrcv()
+Subject: [PATCH] communicate: check return status of msgrcv()
 
 msgrcv can return with -1 to indicate an error condition.
 One such error is to have been interrupted by a signal.
-- 
2.17.1
