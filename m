From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 20:25:24 +0100
Subject: [Buildroot] [git commit] package/ipset: bump to version 7.4
Message-ID: <20191202083936.1559781032@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff9409f4036a3aa8c01c60db1ba1ccd5559ddc47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See full changelog http://ipset.netfilter.org/changelog.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipset/ipset.hash | 6 +++---
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 7405accd1a..25c0e69fe3 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,6 +1,6 @@
-# From http://ipset.netfilter.org/ipset-7.2.tar.bz2.md5sum.txt
-md5 9eef4a237f9ccec48744836ee1497dba  ipset-7.2.tar.bz2
+# From http://ipset.netfilter.org/ipset-7.4.tar.bz2.md5sum.txt
+md5 f9dda6f2fc3bb941e0ca3a6c292baf2c  ipset-7.4.tar.bz2
 # Calculated based on the hash above
-sha256 2e13384534669edc85ca6ab418c59429d5296132c5c27c44479d4c0a59434618  ipset-7.2.tar.bz2
+sha256 4a974176e57fe4b7e2984abb231c4a18af2291bdc41536ef64e4b8ec4d4a1884  ipset-7.4.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index b8ba932d29..ab3fb85fe6 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 7.2
+IPSET_VERSION = 7.4
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
