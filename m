From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:59:45 +0200
Subject: [Buildroot] [git commit] package/freetype: bump version to 2.10.2
Message-ID: <20200617205808.09DAB83BC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d32fc1f9c981ce7ad24764e28b20fb1e7f04995b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/projects/freetype/files/freetype2/2.10.2/

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freetype/freetype.hash | 14 +++++++-------
 package/freetype/freetype.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index c4e75c327c..7fc00f1c97 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,9 +1,9 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.10.1/
-md5 bd42e75127f8431923679480efb5ba8f freetype-2.10.1.tar.xz
-sha1 79874ef4eaa52025126b71d836453b8279bdd331 freetype-2.10.1.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.10.2/
+md5  7c0d5a39f232d7eb9f9d7da76bf08074  freetype-2.10.2.tar.xz
+sha1  b074d5c34dc0e3cc150be6e7aa6b07c9ec4ed875  freetype-2.10.2.tar.xz
 
 # Locally calculated
-sha256	16dbfa488a21fe827dc27eaf708f42f7aa3bb997d745d31a19781628c36ba26f	freetype-2.10.1.tar.xz
-sha256	fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb	docs/LICENSE.TXT
-sha256	08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1	docs/FTL.TXT
-sha256	c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18	docs/GPLv2.TXT
+sha256  1543d61025d2e6312e0a1c563652555f17378a204a61e99928c9fcef030a2d8b  freetype-2.10.2.tar.xz
+sha256  fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb  docs/LICENSE.TXT
+sha256  08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1  docs/FTL.TXT
+sha256  c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18  docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 8b3a4ca09c..516d1c0cfc 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.10.1
+FREETYPE_VERSION = 2.10.2
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
