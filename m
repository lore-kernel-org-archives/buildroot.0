From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:53:26 +0200
Subject: [Buildroot] [git commit] package/execline: bump version to 2.5.2.0
Message-ID: <20190930204831.2471283ACB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b54790c82984d5b6d084c8af3df80549adcc9255
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the COPYING file is updated to take into account the
copyright year update:

-Copyright (c) 2011-2018 Laurent Bercot <ska-skaware@skarnet.org>
+Copyright (c) 2011-2019 Laurent Bercot <ska-skaware@skarnet.org>

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/execline/execline.hash | 4 ++--
 package/execline/execline.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 6bf3ccff64..2312b5b05c 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 f6993094766652041c21fde9c07ef53a3cd4b93a64123d9578fb4997a2cefca1  execline-2.5.0.0.tar.gz
-sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
+sha256 280bb633cbe96088193225729ad32d80493d68380a127e6bc1789aac64375e29  execline-2.5.2.0.tar.gz
+sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 83205e3706..5f482a32f9 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.5.0.0
+EXECLINE_VERSION = 2.5.2.0
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
