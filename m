From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:17:37 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/openldap:
 security bump to version 2.4.48
Message-ID: <20190902161339.11CAD82537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9237e0e04accb8a31615443d14091aabf954af2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Security fixes:
CVE-2019-13057: Fixed slapd to restrict rootDN proxyauthz to its own databases
CVE-2019-13565: Fixed slapd to initialize SASL SSF per connection

Full changelog:
https://www.openldap.org/lists/openldap-announce/201907/msg00001.html

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
[Peter: fix sha256 hash line]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit ca2dea3b7588b36b15f8057c0b6d5fb5e66c0da2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openldap/openldap.hash | 10 +++++-----
 package/openldap/openldap.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 0b33b8d724..9ea1e7a55d 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,7 +1,7 @@
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.47.md5
-md5 e508f97bfd778fec7799f286e5c07176  openldap-2.4.47.tgz
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.47.sha1
-sha1 c59d52dd75f7d1c7b02f83725da36c322d439674  openldap-2.4.47.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.48.md5
+md5 0729a0711fe096831dedc159e0bbe73f  openldap-2.4.48.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.48.sha1
+sha1 c1984e80f6db038b317bf931866adb38e5537dcd  openldap-2.4.48.tgz
 # Locally computed
-sha256 f54c5877865233d9ada77c60c0f69b3e0bfd8b1b55889504c650047cc305520b  openldap-2.4.47.tgz
+sha256 d9523ffcab5cd14b709fcf3cb4d04e8bc76bb8970113255f372bc74954c6074d  openldap-2.4.48.tgz
 sha256 310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 9dbab731c3..4417bb659b 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.47
+OPENLDAP_VERSION = 2.4.48
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = http://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
