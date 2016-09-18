From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 16:20:56 +0200
Subject: [Buildroot] [git commit] package/efl: bump to 1.18.1
Message-ID: <20160918142118.E674C80504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a39e210244e4c7bf4ac8a511e10227490b6a65f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 81727a2..37354fb 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.18.0.tar.xz.sha256
-sha256	06a0bbf5c28f96731b115b0adfa11374d07beb983ae4612ed25b34f4ab5cbf9e	efl-1.18.0.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.18.1.tar.xz.sha256
+sha256	0c6bd150d8e838f849effd462d91d86255e3aaade47a6077d0aa80d2b8e9d222	efl-1.18.1.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 8038739..949da2d 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.18.0
+EFL_VERSION = 1.18.1
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
