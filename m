From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Feb 2020 23:14:25 +0100
Subject: [Buildroot] [git commit] package/pcre2: bump to version 10.34
Message-ID: <20200309140904.E19A981298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=040780696288dba6e5c7792454d0007365c05641
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcre2/pcre2.hash | 6 +++---
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 03f7eb32db..9b83ccf135 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.33.tar.bz2.sig
-sha256 35514dff0ccdf02b55bd2e9fa586a1b9d01f62332c3356e379eabb75f789d8aa  pcre2-10.33.tar.bz2
+# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.34.tar.bz2.sig
+sha256  74c473ffaba9e13db6951fd146e0143fe9887852ce73406a03277af1d9b798ca  pcre2-10.34.tar.bz2
 # Locally computed
-sha256 982293becea3f18eb4e3ce2145f66638e46d105a27b88418766caf321a684d03  LICENCE
+sha256  982293becea3f18eb4e3ce2145f66638e46d105a27b88418766caf321a684d03  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 61f41e06ea..cedf4652a8 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.33
+PCRE2_VERSION = 10.34
 PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
