From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 22:49:04 +0100
Subject: [Buildroot] [git commit] gnupg: bump to version 1.4.20
Message-ID: <20151220215009.25923822F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aee96dcc61ee72f0983f283b6599d95be03269d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg/gnupg.hash | 4 ++--
 package/gnupg/gnupg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg/gnupg.hash b/package/gnupg/gnupg.hash
index ba38d38..f872d24 100644
--- a/package/gnupg/gnupg.hash
+++ b/package/gnupg/gnupg.hash
@@ -1,2 +1,2 @@
-# From http://lists.gnupg.org/pipermail/gnupg-announce/2015q1/000363.html
-sha1	5503f7faa0a0e84450838706a67621546241ca50	gnupg-1.4.19.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2015q4/000382.html
+sha1	cbc9d960e3d8488c32675019a79fbfbf8680387e	gnupg-1.4.20.tar.bz2
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index f358fa3..8893a1c 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG_VERSION = 1.4.19
+GNUPG_VERSION = 1.4.20
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+
