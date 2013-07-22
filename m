From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Jul 2013 07:32:55 +0200
Subject: [Buildroot] [git commit] udisks: fix typos in license info
Message-ID: <20130722065629.8718A9A947@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9466ca1dde97c85996d9aa1c54ff8fbae366bebe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udisks/udisks.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 5d3368d..28855dd 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -6,8 +6,8 @@
 
 UDISKS_VERSION = 1.0.4
 UDISKS_SITE    = http://hal.freedesktop.org/releases/
-UDISKS_LICENCE = GPLv2+
-UDISKS_LICENCE_FILES = COPYING
+UDISKS_LICENSE = GPLv2+
+UDISKS_LICENSE_FILES = COPYING
 
 UDISKS_DEPENDENCIES = 	\
 	sg3_utils	\
