From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 21:23:11 +0100
Subject: [Buildroot] [git commit] package/hiredis: fix makefile code
Message-ID: <20170214202326.AA30081945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adb6ffda7890de932a4f6e435cfd903c345ca039
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hiredis/hiredis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index eb96711..cd406f1 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -19,7 +19,7 @@ ifeq ($(BR2_STATIC_LIBS),y)
 HIREDIS_TARGETS += static
 else ifeq ($(BR2_SHARED_LIBS),y)
 HIREDIS_TARGETS += dynamic
-else ifeq $(BR2_SHARED_STATIC_LIBS),y)
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 HIREDIS_TARGETS += dynamic static
 endif
 
