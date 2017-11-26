From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:40:50 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] package/samba4: bump
 version to 4.6.9
Message-ID: <20171126213857.323D2802C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b907edec11e2ba9a76e00b3a5cb965e03efc0994
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Release notes: https://www.samba.org/samba/history/samba-4.6.9.html

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2be90f4a24a3df487a5c5de9c4708cfa77f172b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 3 ++-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 19b175a..7446b1b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 581deeb2543f5cedcb556cb950d0e82690d9f0cd33811d76624502ca0c32575d  samba-4.6.8.tar.gz
+sha256 c31db4aad82f0b9588ef6c4b4dab5dce3fa1787bd298e62d953c2628bb1af21a  samba-4.6.9.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index f8001bb..7502fa6 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.6.8
+SAMBA4_VERSION = 4.6.9
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
