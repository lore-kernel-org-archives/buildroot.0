From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 16:56:32 +0100
Subject: [Buildroot] [git commit] erlang-goldrush: bump to version 0.1.8
Message-ID: <20160302202754.55E9D80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=532f0b136d18fde9042484030b51e0df05e5a529
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-goldrush/erlang-goldrush.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-goldrush/erlang-goldrush.mk b/package/erlang-goldrush/erlang-goldrush.mk
index b18a8ec..2fa8810 100644
--- a/package/erlang-goldrush/erlang-goldrush.mk
+++ b/package/erlang-goldrush/erlang-goldrush.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_GOLDRUSH_VERSION = 0.1.6
+ERLANG_GOLDRUSH_VERSION = 0.1.8
 ERLANG_GOLDRUSH_SITE = $(call github,DeadZen,goldrush,$(ERLANG_GOLDRUSH_VERSION))
 ERLANG_GOLDRUSH_LICENSE = ISC
 ERLANG_GOLDRUSH_LICENSE_FILES = LICENSE
