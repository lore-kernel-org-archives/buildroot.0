From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 27 Oct 2020 19:27:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/pcre2: bump to version 10.35
Message-ID: <20201027182756.449229-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update LICENCE hash (update in year:
https://vcs.pcre.org/pcre2/code/trunk/LICENCE?r1=1078&r2=1244)

https://www.pcre.org/news.txt
https://www.pcre.org/changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcre2/pcre2.hash | 6 +++---
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 9b83ccf135..81313039f0 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.34.tar.bz2.sig
-sha256  74c473ffaba9e13db6951fd146e0143fe9887852ce73406a03277af1d9b798ca  pcre2-10.34.tar.bz2
+# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.35.tar.bz2.sig
+sha256  9ccba8e02b0ce78046cdfb52e5c177f0f445e421059e43becca4359c669d4613  pcre2-10.35.tar.bz2
 # Locally computed
-sha256  982293becea3f18eb4e3ce2145f66638e46d105a27b88418766caf321a684d03  LICENCE
+sha256  9cb35e4fe442e49d1fbe9c7e07d9601ac959774b24e1884665a3e2f88b7f0831  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index cedf4652a8..ddb53280f2 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.34
+PCRE2_VERSION = 10.35
 PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
-- 
2.28.0
