From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:15 -0000
Subject: [Buildroot] [git commit] package/rauc: Version bump to 0.3
Message-ID: <20180305200712.8FDAB80FFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab863898812a926f0ee687269c2e2ed61bc7adc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's a bug in 0.2 which prevents proper operation when activated via
D-Bus, which is why I'm bumping this.

Signed-off-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Link: https://github.com/rauc/rauc/issues/125
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 649d19571e..91d7c1d62e 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v0.2/rauc-0.2.tar.xz.asc
-sha256 83aa3ac3716e1c29315162e3cbf5d4db79f26dd95efe1bc634bbce364b95491a rauc-0.2.tar.xz
+# https://github.com/rauc/rauc/releases/download/v0.3/rauc-0.3.tar.xz.asc
+sha256 dc01bfb08b1830376782f9a51cfec290171519267ab97cc909435da9ac6d6d98 rauc-0.3.tar.xz
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 4909062cf5..63fbc53022 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 0.2
+RAUC_VERSION = 0.3
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
