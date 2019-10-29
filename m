From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Oct 2019 11:49:43 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/sudo: bump to
 version 1.8.27
Message-ID: <20191029104654.E9AF08D3B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90de6c5aa2e0fab5a11576422ea35f9808fb6092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update hash of license file:
 - update in year
 - add arc4random.c, arc4random_uniform.c and getentropy.c license (ISC)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 276072dbd46973589ff6c368ee47265269029300)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.hash | 4 ++--
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 3f20ccb15e..8a3511df82 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: http://www.sudo.ws/download.html
-sha256 d863d29b6fc87bc784a3223350e2b28a2ff2c4738f0fb8f1c92bb38c3017e679  sudo-1.8.23.tar.gz
+sha256 7beb68b94471ef56d8a1036dbcdc09a7b58a949a68ffce48b83f837dd33e2ec0  sudo-1.8.27.tar.gz
 # Locally calculated
-sha256 b6625a7b58e9469a7adfd1732960579a19fe84b3508030f9a31641283e2250b8  doc/LICENSE
+sha256 e0e7990185834e9f08f3e922905d7bfaf998d13be668c6026d2586b1718210ba  doc/LICENSE
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 136b6c6915..48c8921043 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.23
+SUDO_VERSION = 1.8.27
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
