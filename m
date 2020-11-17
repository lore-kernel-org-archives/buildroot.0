From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 17 Nov 2020 21:17:00 +0100
Subject: [Buildroot] [PATCH 3/6] package/belr: bump to version 4.4.8
In-Reply-To: <20201117201703.137790-1-fontaine.fabrice@gmail.com>
References: <20201117201703.137790-1-fontaine.fabrice@gmail.com>
Message-ID: <20201117201703.137790-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/belr/belr.hash | 2 +-
 package/belr/belr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/belr/belr.hash b/package/belr/belr.hash
index 42cf506972..00c733c7df 100644
--- a/package/belr/belr.hash
+++ b/package/belr/belr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d6575c36c32828edcaf39df2775070b187019b21fe5fe274e7a85caf54284f05  belr-4.3.1.tar.gz
+sha256  6358aa680193d972c831d677da1652c7f57d7e00649b971d4d9fbdebf4331b48  belr-4.4.8.tar.gz
 sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/belr/belr.mk b/package/belr/belr.mk
index 8855f94fda..f243830a85 100644
--- a/package/belr/belr.mk
+++ b/package/belr/belr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BELR_VERSION = 4.3.1
+BELR_VERSION = 4.4.8
 BELR_SITE = https://gitlab.linphone.org/BC/public/belr/-/archive/$(BELR_VERSION)
 BELR_LICENSE = GPL-3.0+
 BELR_LICENSE_FILES = LICENSE.txt
-- 
2.29.2
