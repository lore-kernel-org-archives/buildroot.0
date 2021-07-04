From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Jul 2021 16:17:01 +0200
Subject: [Buildroot] [git commit] package/findutils: bump to version 4.8.0
Message-ID: <20210704134422.567DE8FF5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9273b0df81e09e4ee02488cb65c34fc1e0ede4e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://git.savannah.gnu.org/cgit/findutils.git/tree/NEWS?h=v4.8.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/findutils/findutils.hash | 4 ++--
 package/findutils/findutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/findutils/findutils.hash b/package/findutils/findutils.hash
index 392c62d254..26dbe59181 100644
--- a/package/findutils/findutils.hash
+++ b/package/findutils/findutils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	c5fefbdf9858f7e4feb86f036e1247a54c79fc2d8e4b7064d5aaa1f47dfa789a	findutils-4.7.0.tar.xz
+sha256  57127b7e97d91282c6ace556378d5455a9509898297e46e10443016ea1387164  findutils-4.8.0.tar.xz
 
 # Hash for license file
-sha256	3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986	COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index a16f827166..918591c53f 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FINDUTILS_VERSION = 4.7.0
+FINDUTILS_VERSION = 4.8.0
 FINDUTILS_SOURCE = findutils-$(FINDUTILS_VERSION).tar.xz
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPL-3.0+
