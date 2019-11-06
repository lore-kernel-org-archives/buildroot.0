From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 15:50:07 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/fakeroot: remove
 1/1 numbering from patch
Message-ID: <20191106144912.E990B8E8BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2c468980e0be07d28f0a39acc5b0ba5257adfca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

check-package warns with:
    0002-communicate-check-return-status-of-msgrcv.patch
    generate your patches with 'git format-patch -N'

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c25dd2dd089b48779e0e5a7aef5293a8d4f68d5c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
