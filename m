From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:29:47 +0200
Subject: [Buildroot] [git commit] package/spice: security bump to version
 0.15.0
Message-ID: <20210718205611.D7A5588307@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=b784f1bc0fc3ac33a20549069a81ff98260b58e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-20201: A flaw was found in spice in versions before
0.14.92. A DoS tool might make it easier for remote attackers to cause a
denial of service (CPU consumption) by performing many renegotiations
within a single connection.

https://gitlab.freedesktop.org/spice/spice/-/tags/v0.15.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spice/spice.hash | 2 +-
 package/spice/spice.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spice/spice.hash b/package/spice/spice.hash
index 8f84c2321f..b228f213a5 100644
--- a/package/spice/spice.hash
+++ b/package/spice/spice.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  551d4be4a07667cf0543f3c895beb6da8a93ef5a9829f2ae47817be5e616a114  spice-0.14.3.tar.bz2
+sha256  b320cf8f4bd2852750acb703c15b72856027e5a8554f8217dfbb3cc09deba0f5  spice-0.15.0.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index b515431cf1..ab35265ab4 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_VERSION = 0.14.3
+SPICE_VERSION = 0.15.0
 SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE = http://www.spice-space.org/download/releases/spice-server
 SPICE_LICENSE = LGPL-2.1+
