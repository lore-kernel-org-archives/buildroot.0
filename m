From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 21:51:30 +0200
Subject: [Buildroot] [git commit] cups: bump version to 2.2.3
Message-ID: <20170329195155.5C9717FCD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ead8c71eb4caf25bf75029ba1007982ee4c2a20e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cups/cups.hash | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 08c8c3c..0eb415e 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,2 +1,2 @@
 # Locally calculated:
-sha256 f589bb7d5d1dc3aa0915d7cf2b808571ef2e1530cd1a6ebe76ae8f9f4994e4f6  cups-2.2.2-source.tar.gz
+sha256 66701fe15838f2c892052c913bde1ba106bbee2e0a953c955a62ecacce76885f  cups-2.2.3-source.tar.gz
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index ae3b9ca..d58c78d 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.2.2
+CUPS_VERSION = 2.2.3
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = GPLv2, LGPLv2
