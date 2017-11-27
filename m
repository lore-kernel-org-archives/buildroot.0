From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 09:33:31 +0100
Subject: [Buildroot] [git commit branch/next] dbus: bump to version 1.12.2
Message-ID: <20171127082613.53A898023A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84e3bbcac89b59ee64ab4d92adc18badf86a9ed7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index df1891b..1aa5aa4 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.0.tar.gz.asc
-sha256	39af0d9267391434b549c5c4adc001b735518c96f7630c3fe7162af1d13ef3c0  dbus-1.12.0.tar.gz
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.2.tar.gz.asc
+sha256	272bb5091770b047c8188b926d5e6038fa4fe6745488b2add96b23e2d9a83d88  dbus-1.12.2.tar.gz
 # Locally calculated
 sha256	0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 56a54e3..22ba22e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.12.0
+DBUS_VERSION = 1.12.2
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
