From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:26:35 +0200
Subject: [Buildroot] [git commit] package/lft: bump version to 3.8
Message-ID: <20191007202515.F3D2B8A4B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31745b987fbdde77c8e9aeb9f0d5bd3603d44f0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lft/lft.hash | 5 +++--
 package/lft/lft.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lft/lft.hash b/package/lft/lft.hash
index 1b0454cf5d..91a1fb0659 100644
--- a/package/lft/lft.hash
+++ b/package/lft/lft.hash
@@ -1,4 +1,5 @@
 # From http://pwhois.org/lft/
-md5 746dc08f2e20d0e0240f28873b3bb244  lft-3.79.tar.gz
+md5 31b15aabc619707427a73657512560f8  lft-3.8.tar.gz
 # Locally calculated
-sha256 08e5c7973551b529c850bffbc7152c4e5f0bcb1f07ebbb39151a7dc9a3bf9de0  lft-3.79.tar.gz
+sha256 10f427e77b0f8207817329bd8ef0310078434612620073369264d15e6f97e990  lft-3.8.tar.gz
+sha256 e3b7634630e6800eccca6ecafb5d40153d4f8f7a20e2b2399bf3c0ea92f44614  COPYING
diff --git a/package/lft/lft.mk b/package/lft/lft.mk
index 0555ab9a1a..5154c83fef 100644
--- a/package/lft/lft.mk
+++ b/package/lft/lft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFT_VERSION = 3.79
+LFT_VERSION = 3.8
 LFT_SITE = http://pwhois.org/get
 LFT_DEPENDENCIES = libpcap
 LFT_LICENSE = VOSTROM Public License for Open Source
