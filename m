From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 May 2020 23:26:42 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/openldap:
 security bump to version 2.4.50
Message-ID: <20200529210948.96E3991DC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46988a0f838b997017057932612ed1e7890a9f85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Security fixes:
 CVE-2020-12243: Fixed slapd to limit depth of nested filters

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9e9c242fb73fe19248c48ac28c083851d14f6813)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openldap/openldap.hash | 12 ++++++------
 package/openldap/openldap.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 7f159cb6d0..6790e8b7aa 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,7 +1,7 @@
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.49.md5
-md5 2a47a6bb4319357ea7b032c45283e79e  openldap-2.4.49.tgz
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.49.sha1
-sha1 f0caeca122e6f90e6ac5cc8ba36fe9cec13826da  openldap-2.4.49.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.50.md5
+md5  f9ed44ef373abed04c9e4c8586260f9e  openldap-2.4.50.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.50.sha1
+sha1  82f576e0d0d334e9e798d9de8936683546247bb9  openldap-2.4.50.tgz
 # Locally computed
-sha256 e3b117944b4180f23befe87d0dcf47f29de775befbc469dcf4ac3dab3311e56e  openldap-2.4.49.tgz
-sha256 310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
+sha256  5cb57d958bf5c55a678c6a0f06821e0e5504d5a92e6a33240841fbca1db586b8  openldap-2.4.50.tgz
+sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index a5f6067494..a9e71be595 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.49
+OPENLDAP_VERSION = 2.4.50
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
