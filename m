From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:01:57 +0200
Subject: [Buildroot] [git commit] package/libyaml: bump version to 0.2.5
Message-ID: <20200705125938.9D42484545@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5946e3d2a7566b3373c4a944d1a2b12d50cd3f52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also:
- License file renamed LICENSE -> License
- Change license hash because copyright year changed 2019 -> 2020
- Separate the fields in the hash file by two spaces

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libyaml/libyaml.hash | 4 ++--
 package/libyaml/libyaml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libyaml/libyaml.hash b/package/libyaml/libyaml.hash
index 49693b507b..0de9e527a5 100644
--- a/package/libyaml/libyaml.hash
+++ b/package/libyaml/libyaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 4a9100ab61047fd9bd395bcef3ce5403365cafd55c1e0d0299cde14958e47be9  yaml-0.2.2.tar.gz
-sha256 a2adb9c959b797494a0ef80bdf60e22db2749ee3e0c0908556e3eb548f967c56  LICENSE
+sha256  c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4  yaml-0.2.5.tar.gz
+sha256  c40112449f254b9753045925248313e9270efa36d226b22d82d4cc6c43c57f29  License
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index 1ba069a1b2..f65317aab7 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBYAML_VERSION = 0.2.2
+LIBYAML_VERSION = 0.2.5
 LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
 LIBYAML_SITE = http://pyyaml.org/download/libyaml
 LIBYAML_INSTALL_STAGING = YES
 LIBYAML_LICENSE = MIT
-LIBYAML_LICENSE_FILES = LICENSE
+LIBYAML_LICENSE_FILES = License
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
