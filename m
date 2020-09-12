From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 14:18:06 +0200
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 2.7.2
Message-ID: <20200912121059.128DD7FF75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4424cb905966f7cb975a7e1aad7b62370dbd7560
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 660e19efc9..dac859bbd4 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6648a571a27f186e47094121f0095e1b809e918b3037c630c7f38ffad86e3035  harfbuzz-2.6.8.tar.xz
+sha256  b8c048d7c2964a12f2c80deb6634dfc836b603dd12bf0d0a3df1627698e220ce  harfbuzz-2.7.2.tar.xz
 sha256  beb3f017ceb41387667f78237a7cecf84defa0ed257c505894663d6a9f13211b  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index c7bb8f9347..54932f69df 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.6.8
+HARFBUZZ_VERSION = 2.7.2
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
