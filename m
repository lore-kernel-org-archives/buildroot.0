From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 23:04:32 +0200
Subject: [Buildroot] [git commit branch/next] package/libaacs: bump version
 to 0.10.0
Message-ID: <20200515204850.B2CF3919E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df7ffdcc81b3c9aafa5476ea03bf88fef8da6a26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://code.videolan.org/videolan/libaacs/-/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libaacs/libaacs.hash | 6 +++---
 package/libaacs/libaacs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libaacs/libaacs.hash b/package/libaacs/libaacs.hash
index 22310295f8..82e8698616 100644
--- a/package/libaacs/libaacs.hash
+++ b/package/libaacs/libaacs.hash
@@ -1,5 +1,5 @@
-# From http://download.videolan.org/pub/videolan/libaacs/0.9.0/libaacs-0.9.0.tar.bz2.sha512
-sha512 b9c658db22a0966486070d3b762509a7c0120469ab29d1e57c1b624cad309701de8b92455ec649db4d731be4a5c29c38fb4f99bb7617dbb4254270284a1903f6  libaacs-0.9.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libaacs/0.10.0/libaacs-0.10.0.tar.bz2.sha512
+sha512  4527749c3c78fd270012b3b36e916356a4aeb8f90169e781a00739f01f190121691042607209864e9b676ede9741f614c6003a7dfbb350dc020e1fa94cd6d66e  libaacs-0.10.0.tar.bz2
 
 # Hash for license file:
-sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libaacs/libaacs.mk b/package/libaacs/libaacs.mk
index 143b0ff3d7..95f1cbdab8 100644
--- a/package/libaacs/libaacs.mk
+++ b/package/libaacs/libaacs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAACS_VERSION = 0.9.0
+LIBAACS_VERSION = 0.10.0
 LIBAACS_SITE = http://download.videolan.org/pub/videolan/libaacs/$(LIBAACS_VERSION)
 LIBAACS_SOURCE = libaacs-$(LIBAACS_VERSION).tar.bz2
 LIBAACS_LICENSE = LGPL-2.1+
