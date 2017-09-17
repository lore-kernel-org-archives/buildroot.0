From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 18:32:08 +0200
Subject: [Buildroot] [git commit] package/pcre2: bump version to 10.30
Message-ID: <20170917162447.F0D6A80FB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=526ea1f30ebea7371defcb3e2aec591a255e31f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcre2/pcre2.hash | 4 ++--
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 97a5d5e..7b125dd 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.23.tar.bz2.sig
-sha256	dfc79b918771f02d33968bd34a749ad7487fa1014aeb787fad29dd392b78c56e	pcre2-10.23.tar.bz2
+# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.30.tar.bz2.sig
+sha256 90bd41c605d30e3745771eb81928d779f158081a51b2f314bbcc1f73de5773db  pcre2-10.30.tar.bz2
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index b7da1ed..3844622 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.23
+PCRE2_VERSION = 10.30
 PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
