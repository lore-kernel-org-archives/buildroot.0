From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 23:19:11 +0100
Subject: [Buildroot] [git commit] package/omniorb: bump to 4.2.3
Message-ID: <20191031221253.E0A568E3D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9077d2b90b71570c801ae27271541cffe4706114
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- added sha256 hash values for archive and license files
- updated sha1 from upstream download site

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/omniorb/omniorb.hash | 10 +++++++---
 package/omniorb/omniorb.mk   |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/omniorb/omniorb.hash b/package/omniorb/omniorb.hash
index 3f4af2e64a..9911c4d6af 100644
--- a/package/omniorb/omniorb.hash
+++ b/package/omniorb/omniorb.hash
@@ -1,3 +1,7 @@
-# From http://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.2.2/
-sha1 0c682542290cabb22878b3ef492de3e85c4b4281  omniORB-4.2.2.tar.bz2
-md5 cc6b2a65a2b1c1b3d44b3ccbaf92e104  omniORB-4.2.2.tar.bz2
+# From http://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.2.3/
+sha1	0af1b8c181088c096de237315cce7b52fc457c78  omniORB-4.2.3.tar.bz2
+
+# Locally generated
+sha256	26412ac08ab495ce5a6a8e40961fa20b7c43f623c6c26b616d210ca32f078bca  omniORB-4.2.3.tar.bz2
+sha256	126647a6ee062fe46f8f3766965dc62e031c0a31238a347e4bc07aab2ac1e2a7  COPYING
+sha256	eaf5b13ffd5355da7c0b83074e4b798152ff7086c95c4f3045122a06e2673eb9  COPYING.LIB
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 2f094b5769..b5caf6ff8b 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMNIORB_VERSION = 4.2.2
+OMNIORB_VERSION = 4.2.3
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
