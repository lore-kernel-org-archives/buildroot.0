From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:26:48 +0100
Subject: [Buildroot] [git commit] package/botan: bump to version 2.17.3
Message-ID: <20201226170943.A1CDA88162@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e1c1d8aed5004b57388aae57291300a0b07e852
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://botan.randombit.net/news.html#version-2-17-3-2020-12-21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.hash | 2 +-
 package/botan/botan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index f8fa6e5151..d1b1d14acb 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  ebe27dfe2b55d7e02bf520e926606c48b76b22facb483256b13ab38e018e1e6c  Botan-2.17.2.tar.xz
+sha256  79123b654445a4abba486e09a431788545c708237382a3e765664c9f55b03b88  Botan-2.17.3.tar.xz
 # Locally computed
 sha256  fb7f0322d36fba55ca17d77bc203a9f09a40daa8a249b75cf8887aba36cec9d0  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 4fe2e54c55..0f251fc350 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.17.2
+BOTAN_VERSION = 2.17.3
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
