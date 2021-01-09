From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Jan 2021 16:10:33 +0100
Subject: [Buildroot] [git commit] package/nano: bump to version 5.4
Message-ID: <20210109145347.4E02980584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32d962700b81e162bd0b50a00748ccbc2ee15bc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/Config.in | 2 +-
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nano/Config.in b/package/nano/Config.in
index 4b340ff5b8..b0b7a3e7a3 100644
--- a/package/nano/Config.in
+++ b/package/nano/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_NANO
 	  A nice ncurses-based editor. Started out as a clone of pico.
 	  Great editor for new users.
 
-	  http://www.nano-editor.org/
+	  https://www.nano-editor.org/
 
 if BR2_PACKAGE_NANO
 
diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 792f18a098..2126f576a4 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v5/nano-5.2.tar.xz.asc
+# https://www.nano-editor.org/dist/v5/nano-5.4.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256  32c2da43e1ae9a5e43437d8c6e1ec0388af870c7762c479e5bffb5f292bda7e1  nano-5.2.tar.xz
+sha256  fe993408b22286355809ce48ebecc4444d19af8203ed4959d269969112ed86e9  nano-5.4.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 67ce072980..a86474bfb4 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 5
-NANO_VERSION = $(NANO_VERSION_MAJOR).2
+NANO_VERSION = $(NANO_VERSION_MAJOR).4
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
