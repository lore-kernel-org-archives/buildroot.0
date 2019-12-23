From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:59:59 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/cups: security
 bump to version 2.2.13
Message-ID: <20191223085207.689F38DF55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15630c73b60736f15df71a131ddbbc194759d55f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes CVE-2019-2228: The ippSetValuetag function did not validate the
default language value.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.hash | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index d75387c405..676f664b72 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 0f61ab449e4748a24c6ab355b481ff7691247a140d327b2b7526fce34b7f9aa8  cups-2.2.12-source.tar.gz
+sha256 da375796e5e7ab6d31a853d0e5326486d41d10d42bbff9ec768b0cea85031b48  cups-2.2.13-source.tar.gz
 sha256 6e0e0ffbde118aae709f7ef65590de9071e8b2cd322f84fd645c6b64f3cc452c  LICENSE.txt
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 21e4c221fb..904a55f1e1 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.2.12
+CUPS_VERSION = 2.2.13
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = GPL-2.0, LGPL-2.0
