From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 10:41:02 +0100
Subject: [Buildroot] [git commit] aumix.mk: fix whitespace
Message-ID: <20130304094257.301A39AE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e7d5d0a93114ed49095079f66124dd163e23f9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change.

[Peter: adjust commit message]
Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/aumix/aumix.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/multimedia/aumix/aumix.mk b/package/multimedia/aumix/aumix.mk
index 534f3cf..130bda0 100644
--- a/package/multimedia/aumix/aumix.mk
+++ b/package/multimedia/aumix/aumix.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-AUMIX_VERSION=2.8
-AUMIX_SOURCE=aumix-$(AUMIX_VERSION).tar.bz2
-AUMIX_SITE=http://jpj.net/~trevor/aumix/releases
-AUMIX_AUTORECONF=YES
+AUMIX_VERSION = 2.8
+AUMIX_SOURCE = aumix-$(AUMIX_VERSION).tar.bz2
+AUMIX_SITE = http://jpj.net/~trevor/aumix/releases
+AUMIX_AUTORECONF = YES
 
 AUMIX_CONF_OPT = \
 	--without-gtk \
