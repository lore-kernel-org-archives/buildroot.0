From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 10:43:05 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/freetype:
 security bump version to 2.10.4
Message-ID: <20201109095104.E9C2A8816B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4be526c1eb90a5e580576753661689a2a2e2707f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes CVE-2020-15999, https://www.freetype.org/index.html#news

"This is an emergency release, fixing a severe vulnerability in embedded
 PNG bitmap handling [...].

 All users should update immediately."

Removed md5 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1ffe654c6d4e5428520378feb0f04dc1f8c951a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.hash | 7 +++----
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 7fc00f1c97..36571b51af 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,9 +1,8 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.10.2/
-md5  7c0d5a39f232d7eb9f9d7da76bf08074  freetype-2.10.2.tar.xz
-sha1  b074d5c34dc0e3cc150be6e7aa6b07c9ec4ed875  freetype-2.10.2.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.10.4/
+sha1  0181862673f7216ad2b5074f95fc131209e30b27  freetype-2.10.4.tar.xz
 
 # Locally calculated
-sha256  1543d61025d2e6312e0a1c563652555f17378a204a61e99928c9fcef030a2d8b  freetype-2.10.2.tar.xz
+sha256  86a854d8905b19698bbc8f23b860bc104246ce4854dcea8e3b0fb21284f75784  freetype-2.10.4.tar.xz
 sha256  fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb  docs/LICENSE.TXT
 sha256  08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1  docs/FTL.TXT
 sha256  c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18  docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index f4d71bedf7..e543aee0b2 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.10.2
+FREETYPE_VERSION = 2.10.4
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
