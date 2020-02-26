From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 22:48:36 +0100
Subject: [Buildroot] [git commit branch/next] package/botan: bump to version
 2.13.0
Message-ID: <20200226213634.64A268EBDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c19b5a39fc9d7b587193f74dcd900b579577f559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Calculate hash of tarball locally, hash of 2.13.0 is not in
  https://botan.randombit.net/releases/sha256sums.txt
- Update hash of license file (update in year:
  https://github.com/randombit/botan/commit/3567c921c102448fabc8c2643a1cb6acdb6f9e5c)
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.hash | 5 ++---
 package/botan/botan.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index a04825a758..29efddb35c 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,3 @@
-# From https://botan.randombit.net/releases/sha256sums.txt
-sha256 f7874da2aeb8c018fd77df40b2137879bf90b66f5589490c991e83fb3e8094be  Botan-2.11.0.tar.xz
 # Locally computed
-sha256 161011a9be56a6e825c06257005055a148056b5c756f75a0b99dae0883fcab7a  license.txt
+sha256  f57ae42a41e1091bca58f44f41addebd9a390b651603952c881ec89d50187e90  Botan-2.13.0.tar.xz
+sha256  fb7f0322d36fba55ca17d77bc203a9f09a40daa8a249b75cf8887aba36cec9d0  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 62027280d3..6394b5ef95 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.11.0
+BOTAN_VERSION = 2.13.0
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
