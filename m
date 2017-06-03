From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jun 2017 17:09:21 +0200
Subject: [Buildroot] [git commit] package/libaacs: bump version to 0.9.0
Message-ID: <20170603151115.A7FA2821D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f2272ea6241dbbd3d5f21cb6cd056d075fec428
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libaacs/libaacs.hash | 4 ++--
 package/libaacs/libaacs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libaacs/libaacs.hash b/package/libaacs/libaacs.hash
index 7160c6a..84947e0 100644
--- a/package/libaacs/libaacs.hash
+++ b/package/libaacs/libaacs.hash
@@ -1,2 +1,2 @@
-# From http://download.videolan.org/pub/videolan/libaacs/0.8.1/libaacs-0.8.1.tar.bz2.sha512
-sha512	dd677627f073460b719b9f836b026acc3e23b166c7b16bd205cf2ca97c376095980532fb15087c0d77b30c712cd5a5dd90b2cc2ae3128da717621ebd825afcc4	libaacs-0.8.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libaacs/0.9.0/libaacs-0.9.0.tar.bz2.sha512
+sha512 b9c658db22a0966486070d3b762509a7c0120469ab29d1e57c1b624cad309701de8b92455ec649db4d731be4a5c29c38fb4f99bb7617dbb4254270284a1903f6  libaacs-0.9.0.tar.bz2
diff --git a/package/libaacs/libaacs.mk b/package/libaacs/libaacs.mk
index a73dac6..143b0ff 100644
--- a/package/libaacs/libaacs.mk
+++ b/package/libaacs/libaacs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAACS_VERSION = 0.8.1
+LIBAACS_VERSION = 0.9.0
 LIBAACS_SITE = http://download.videolan.org/pub/videolan/libaacs/$(LIBAACS_VERSION)
 LIBAACS_SOURCE = libaacs-$(LIBAACS_VERSION).tar.bz2
 LIBAACS_LICENSE = LGPL-2.1+
