From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Dec 2015 17:19:50 +0100
Subject: [Buildroot] [git commit] nano: bump to version 2.5.0
Message-ID: <20151207162023.8924A81950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1c53430c4c103f9da18a461a1fb12b76d322d5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index c924151..8da4b55 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  32d627072b6026678e4f4095c047adec92ac7ec542dd6d91cf27f49b601768f2  nano-2.4.3.tar.gz
+sha256  ff323e6fef74caf0a924304841c07ac65ec30db99dc5c1f8272b4c536a5c89ee  nano-2.5.0.tar.gz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 28161f3..5bcdfd4 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANO_VERSION = 2.4.3
+NANO_VERSION = 2.5.0
 NANO_SITE = $(BR2_GNU_MIRROR)/nano
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
