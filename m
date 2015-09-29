From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Sep 2015 19:36:26 +0200
Subject: [Buildroot] [git commit] xz: bump to version 5.2.2
Message-ID: <20150929173630.615FE81D5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f355849c9ec11bee978f712328f33f97342c2ebb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xz/xz.hash |    2 +-
 package/xz/xz.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index da523d9..f723f7e 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  679148f497e0bff2c1adce42dee5a23f746e71321c33ebb0f641a302e30c2a80  xz-5.2.1.tar.bz2
+sha256 6ff5f57a4b9167155e35e6da8b529de69270efb2b4cf3fbabf41a4ee793840b5  xz-5.2.2.tar.bz2
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 503275c..ac6f809 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.2.1
+XZ_VERSION = 5.2.2
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
