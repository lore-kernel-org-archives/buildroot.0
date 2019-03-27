From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 10:45:40 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/cups: bump
 version to 2.2.7
Message-ID: <20190327094316.C438881486@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=721fcd703011e37658a8f3202d707f87671c2482
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Bernd Kuhls &lt;<a href="mailto:bernd.kuhls@t-online.de" target="_blank" rel="noreferrer">bernd.kuhls at t-online.de</a>&gt;<br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c7c2541954597242a1c379d218aea4e295ce35cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.hash | 3 ++-
 package/cups/cups.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index d4f20b60db..a19b3b09a6 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,2 +1,3 @@
 # Locally calculated:
-sha256 a8795e2aa54dcfbdc9ff254a770f0d7154e35c981bca5b3369050c5193ab5a21  cups-2.2.5-source.tar.gz
+sha256 3c4b637b737077565ccdfbd5f61785d03f49461ae736fcc2c0ffaf41d2c6ea6a  cups-2.2.7-source.tar.gz
+sha256 6e0e0ffbde118aae709f7ef65590de9071e8b2cd322f84fd645c6b64f3cc452c  LICENSE.txt
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 0726d8a37f..54271d5fc7 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.2.5
+CUPS_VERSION = 2.2.7
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = GPL-2.0, LGPL-2.0
