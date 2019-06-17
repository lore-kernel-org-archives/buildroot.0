From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 20:06:29 +0200
Subject: [Buildroot] [git commit] package/flatbuffers: bump version to
 v1.11.0
Message-ID: <20190617181036.66A0E812A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10c7b5acec50c56c5ef5f31ecfbed23c24166d49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flatbuffers/flatbuffers.hash | 2 +-
 package/flatbuffers/flatbuffers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index 7afe849cd7..3cd737273a 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	3714e3db8c51e43028e10ad7adffb9a36fc4aa5b1a363c2d0c4303dd1be59a7c	flatbuffers-v1.10.0.tar.gz
+sha256	3f4a286642094f45b1b77228656fbd7ea123964f19502f9ecfd29933fd23a50b	flatbuffers-v1.11.0.tar.gz
 sha256	7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3	LICENSE.txt
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 69054885ea..8252a1616c 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = v1.10.0
+FLATBUFFERS_VERSION = v1.11.0
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE.txt
