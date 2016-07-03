From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 12:43:39 +0200
Subject: [Buildroot] [git commit] cups: bump to version 2.1.4,
	change upstream location
Message-ID: <20160703104344.AA38D81E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bfde6a73a9ab85a4df6b04966c907de2973deae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cups is now available from Github, with tarballs uploaded by the
maintainers, so we use this new upstream location.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cups/cups.hash | 2 +-
 package/cups/cups.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index f38399f..2d103f2 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,2 +1,2 @@
 # Locally calculated:
-sha256 bab0ca3ba80eae48319b3a6b19a5b14fad5ce230f30151a0cfa4c0271df281ad  cups-2.1.2-source.tar.bz2
+sha256 4b14fd833180ac529ebebea766a09094c2568bf8426e219cb3a1715304ef728d  cups-2.1.4-source.tar.gz
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 797d31a..2f8a18e 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.1.2
-CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
-CUPS_SITE = http://www.cups.org/software/$(CUPS_VERSION)
+CUPS_VERSION = 2.1.4
+CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
+CUPS_SITE = https://github.com/apple/cups/releases/download/release-$(CUPS_VERSION)
 CUPS_LICENSE = GPLv2 LGPLv2
 CUPS_LICENSE_FILES = LICENSE.txt
 CUPS_INSTALL_STAGING = YES
