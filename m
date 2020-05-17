From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 17 May 2020 10:40:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/acsccid: bump to version 1.1.8
Message-ID: <20200517084053.17451-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- update indentation of hash file (two spaces)

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/acsccid/acsccid.hash | 8 ++++----
 package/acsccid/acsccid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
index 2d61ad6643..f43a7930a4 100644
--- a/package/acsccid/acsccid.hash
+++ b/package/acsccid/acsccid.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.7/
-sha1 f4db3c2393f392191291df128008832e245d821b acsccid-1.1.7.tar.bz2
-md5 0b34146571d9492ecfff066582dd9356 acsccid-1.1.7.tar.bz2
+sha1  c0062401e5fedf3ec12c8c2d375d6e1561a8a8ed  acsccid-1.1.8.tar.bz2
+md5  3eba7b2527aa0b14c73b1a620a1d72d2  acsccid-1.1.8.tar.bz2
 # Locally computed
-sha256 3778548ff9b639dd46d1570922e425698e16c5a0a0840ed1fad235052e291ee3  acsccid-1.1.7.tar.bz2
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
+sha256  f86fd846bc88594a569ea27040cb441d933b7eca8d51d2a90bacf161e7740051  acsccid-1.1.8.tar.bz2
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index 28a31b95a3..db74e9cb76 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACSCCID_VERSION = 1.1.7
+ACSCCID_VERSION = 1.1.8
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
 ACSCCID_LICENSE = LGPL-2.1+
-- 
2.20.1
