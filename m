From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2016 23:11:32 +0100
Subject: [Buildroot] [git commit] package/efl: bump to version 1.18.4
Message-ID: <20161208221137.AB4B681E01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a27f8c80462b3f28b741b5d3a57f3346a2321252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug fix release:
https://www.enlightenment.org/news/efl-1.18.4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 4077ddd..5d7a90d 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.18.3.tar.xz.sha256
-sha256	0748ec0847f543d96b149cb3a84e6438724e827a38d530922ecb4bd59d3e64c0	efl-1.18.3.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.18.4.tar.xz.sha256
+sha256	39ebc07e37437d6ecdeb0f645783484e28a882b38f7e619ad12c2bf9b5548025	efl-1.18.4.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 6ddd454..e08f252 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.18.3
+EFL_VERSION = 1.18.4
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
