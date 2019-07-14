From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 12:24:22 +0200
Subject: [Buildroot] [git commit] package/freetype: bump version to 2.10.1
Message-ID: <20190714102543.3F0CE80128@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bf175b7b9ff7331c925d1ae63561dcfe0b8ed17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream does not provide bz2 tarball anymore, switch to xz.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.hash | 8 ++++----
 package/freetype/freetype.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 2095d6eaec..c4e75c327c 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,9 +1,9 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.10.0/
-md5 a717e6925b61b9dda946322ecd278a42 freetype-2.10.0.tar.bz2
-sha1 f6abf03e0e3189a0de883981c57d3861b5d314f5 freetype-2.10.0.tar.bz2
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.10.1/
+md5 bd42e75127f8431923679480efb5ba8f freetype-2.10.1.tar.xz
+sha1 79874ef4eaa52025126b71d836453b8279bdd331 freetype-2.10.1.tar.xz
 
 # Locally calculated
-sha256	fccc62928c65192fff6c98847233b28eb7ce05f12d2fea3f6cc90e8b4e5fbe06	freetype-2.10.0.tar.bz2
+sha256	16dbfa488a21fe827dc27eaf708f42f7aa3bb997d745d31a19781628c36ba26f	freetype-2.10.1.tar.xz
 sha256	fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb	docs/LICENSE.TXT
 sha256	08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1	docs/FTL.TXT
 sha256	c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18	docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 44a9464d13..8b3a4ca09c 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.10.0
-FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
+FREETYPE_VERSION = 2.10.1
+FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
