From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 10:47:06 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/spice: security
 bump to version 0.14.2
Message-ID: <20191203094345.A5A5783BF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d35ee27468228546c24dd7cc4353069c87ab125
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Fix CVE-2019-3813: fix off-by-one error in group/slot boundary check
- Add license hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 808a54aa3b125a05541cbd5682417d3b1aad9c14)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spice/spice.hash | 3 ++-
 package/spice/spice.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/spice/spice.hash b/package/spice/spice.hash
index 1a25926ab2..4243244129 100644
--- a/package/spice/spice.hash
+++ b/package/spice/spice.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	1ead5de63d06eededed4017db37240f07bef0abffbaf621899647e7e685a1519	spice-0.14.1.tar.bz2
+sha256	b203b3882e06f4c7249a3150d90c84e1a90490d41ead255a3d2cede46f4a29a7	spice-0.14.2.tar.bz2
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index b663479920..8c421abf2e 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_VERSION = 0.14.1
+SPICE_VERSION = 0.14.2
 SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE = http://www.spice-space.org/download/releases/spice-server
 SPICE_LICENSE = LGPL-2.1+
