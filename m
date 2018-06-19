From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jun 2018 13:56:33 +0200
Subject: [Buildroot] [git commit] package/waylandpp: bump version to 0.2.3
Message-ID: <20180619115711.9DBDC88EA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10ddd8881ca6ffa64065761ec7d024d2b5a4453a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/waylandpp/waylandpp.hash | 2 +-
 package/waylandpp/waylandpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
index 3a580bf963..1b14814c47 100644
--- a/package/waylandpp/waylandpp.hash
+++ b/package/waylandpp/waylandpp.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 e0c9012f3a5fb69922d5ecabdfbef739f1e0db3e68048b3f63537468ad5c4acd  waylandpp-0.2.2.tar.gz
+sha256 ebd4a8447bb65f288cad0e04538f6ec704e155213fc2b9cc1a851534c70aacac  waylandpp-0.2.3.tar.gz
 sha256 49aa6d728fd13226952c9e3a5a9cae46379b2a501010064760172b5ce7cd94bb  LICENSE
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
index 5c9c96b379..ff17c35c1e 100644
--- a/package/waylandpp/waylandpp.mk
+++ b/package/waylandpp/waylandpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLANDPP_VERSION = 0.2.2
+WAYLANDPP_VERSION = 0.2.3
 WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
 WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
 WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
