From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:09:26 +0200
Subject: [Buildroot] [git commit] package/fakeroot: remove 1/1 numbering
 from patch
Message-ID: <20190921130620.67BC88ED6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c25dd2dd089b48779e0e5a7aef5293a8d4f68d5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package warns with:
    0002-communicate-check-return-status-of-msgrcv.patch
    generate your patches with 'git format-patch -N'

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch | 2 +-
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
