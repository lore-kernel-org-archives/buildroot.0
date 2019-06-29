From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Jun 2019 16:46:28 +0200
Subject: [Buildroot] [PATCH 3/5] package/pcre: bump version to 8.43
In-Reply-To: <20190629144630.8036-1-bernd.kuhls@t-online.de>
References: <20190629144630.8036-1-bernd.kuhls@t-online.de>
Message-ID: <20190629144630.8036-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.exim.org/lurker/message/20190125.161413.ce45dfd2.en.html
https://lists.exim.org/lurker/message/20190223.165009.b0fb3c20.en.html

Updated license hash after upstream commit
https://vcs.pcre.org/pcre/code/tags/pcre-8.43/LICENCE?r1=1749&r2=1734

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pcre/pcre.hash | 4 ++--
 package/pcre/pcre.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index ca72a78cd2..7513d5f198 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 2cd04b7c887808be030254e8d77de11d3fe9d4505c39d4b15d2664ffe8bf9301  pcre-8.42.tar.bz2
+sha256 91e762520003013834ac1adb4a938d53b22a216341c061b0cf05603b290faf6b  pcre-8.43.tar.bz2
 # License files, locally calculated
-sha256 f998c0f52eb704eff28f503580cfca3f2547280aa212994f6cf2d8e317587c1c  LICENCE
+sha256 a5fce68baf797e0918463a4437ef75984c41118f43850ddeabda1b5a90154309  LICENCE
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 163e535ec3..595cda8a53 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.42
+PCRE_VERSION = 8.43
 PCRE_SITE = https://ftp.pcre.org/pub/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3-Clause
-- 
2.20.1
