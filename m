From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 25 Feb 2020 22:30:14 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/pcre2: bump to version 10.34
Message-ID: <20200225213014.1114319-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.25.0
