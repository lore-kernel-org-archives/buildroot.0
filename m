From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 23:55:00 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver/visualisation-*:
	mass version bump, add hashes
Message-ID: <20160302225546.151DA80089@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73e5f09c358ba9078cf37d75a0deb8ccbf9efb05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash   | 2 ++
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk     | 2 +-
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash | 2 ++
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk   | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash   | 2 ++
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk     | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash     | 2 ++
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk       | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash             | 2 ++
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk               | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash           | 2 ++
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk             | 2 +-
 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash | 2 ++
 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk   | 2 +-
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash | 2 ++
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk   | 2 +-
 16 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
new file mode 100644
index 0000000..a70f1b0
--- /dev/null
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 b76b9ba122cebddc7c201b088d93e86fde8fc76e7e9f167ff3e43c3390088f3f kodi-screensaver-asteroids-c7ae05f1881b9abda6a1ac6beaca8d64a164c4fa.tar.gz
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index dce8fb6..1af1f2e 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = d4c2e3b499544ef55be364b34e5569d9c31c9615
+KODI_SCREENSAVER_ASTEROIDS_VERSION = c7ae05f1881b9abda6a1ac6beaca8d64a164c4fa
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,notspiff,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPLv2+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = src/main.cpp
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
new file mode 100644
index 0000000..6fc273d
--- /dev/null
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 25e497c6843a7d933d1e4736e8dcb671bc9881328d5e27349dd0b25cb9be07eb kodi-screensaver-biogenesis-39928eef56ed639085d401dd97bf18f44b1f3e8b.tar.gz
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index 728383f..dce6968 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 2eccbd4e46320de03fde6731c560660659fd34d7
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 39928eef56ed639085d401dd97bf18f44b1f3e8b
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,notspiff,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPLv2+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
new file mode 100644
index 0000000..9339453
--- /dev/null
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 fc114434db18a885fda30ac6b82fe82ec1d5ed97e2ff6414b4927487da684871 kodi-screensaver-greynetic-80e850eb3cbc7ee2c937fcab666dc45d2b2ee0bb.tar.gz
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index 0b16e32..9773bac 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 5f370b0f1a51e57719f605344e94824105316c17
+KODI_SCREENSAVER_GREYNETIC_VERSION = 80e850eb3cbc7ee2c937fcab666dc45d2b2ee0bb
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,notspiff,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPLv2+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = src/GreyNetic.cpp
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
new file mode 100644
index 0000000..79d4dd4
--- /dev/null
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 59a5cdfa6387760205efabcd91bc64fdc92f103c8f213b650018160f6c1a691c kodi-screensaver-pingpong-5c7cf6fd9f9ff1468f620bb891e66bebd3a5fe17.tar.gz
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 324fe3a..2adf960 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 00fd2a7c70d581ada1bc89829c6870530b4c65b9
+KODI_SCREENSAVER_PINGPONG_VERSION = 5c7cf6fd9f9ff1468f620bb891e66bebd3a5fe17
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,notspiff,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPLv2+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = src/readme.txt
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
new file mode 100644
index 0000000..c79e3f5
--- /dev/null
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 951bc3259407b7f21183c34556b1efc4c40bfafec61008cd543f382f67466184 kodi-screensaver-pyro-2476b77d9954980a27e07eb8eb0727e2af226351.tar.gz
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index e4c2b96..f904052 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 7551f3f4b6414c40c1c4170c750b9f45dd995261
+KODI_SCREENSAVER_PYRO_VERSION = 2476b77d9954980a27e07eb8eb0727e2af226351
 KODI_SCREENSAVER_PYRO_SITE = $(call github,notspiff,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPLv2+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = src/Pyro.cpp
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
new file mode 100644
index 0000000..107ada4
--- /dev/null
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 79633afcdccf5df31c98d2144bd23086d691e7749255b4295b183b535d9b7abf kodi-screensaver-stars-28bf79d4dce040e9fbdc25f51007e13950cab937.tar.gz
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index f2a1be1..b5b5206 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = 91b59f687ceb52488763aca4ba67d50a92f01731
+KODI_SCREENSAVER_STARS_VERSION = 28bf79d4dce040e9fbdc25f51007e13950cab937
 KODI_SCREENSAVER_STARS_SITE = $(call github,notspiff,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPLv2+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = src/StarField.cpp
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
new file mode 100644
index 0000000..18e38f5
--- /dev/null
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 aa417d6ad3d3770029e7d8d9f7f0ca8d56a8a4f47821267b5a8604fc26993334 kodi-visualisation-spectrum-9dbe53a0db73f00ee22e9ca235c98f8137b7bb9e.tar.gz
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 79f03c8..de197eb 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = aae1960b5bc14e50914205e2dabcb51077690a64
+KODI_VISUALISATION_SPECTRUM_VERSION = 9dbe53a0db73f00ee22e9ca235c98f8137b7bb9e
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPLv2+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
new file mode 100644
index 0000000..728b857
--- /dev/null
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 439bd50fcb1c0912532d0d113f7eeadf28f72bd2cb0c234581ee1acc2a70e45b kodi-visualisation-waveform-89aec48e2975f820004df5a1a53801339a5b3064.tar.gz
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index eec0cfc..81e880b 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = abbdbffc5fd2dff1d627de8df3cb5a3887d1119c
+KODI_VISUALISATION_WAVEFORM_VERSION = 89aec48e2975f820004df5a1a53801339a5b3064
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPLv2+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
