From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 10:08:56 +0100
Subject: [Buildroot] [git commit] package/leafpad: bump version to 0.8.18.1
Message-ID: <20160201224706.1E11D7F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ea881e711543bae8f03d7c8f049141c5bcce345
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/leafpad/leafpad.hash | 2 +-
 package/leafpad/leafpad.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leafpad/leafpad.hash b/package/leafpad/leafpad.hash
index 5c4cd78..be56d41 100644
--- a/package/leafpad/leafpad.hash
+++ b/package/leafpad/leafpad.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	a047d2f82fb88b361ae7f382b4cae8ce1a30bef5ead503a68ae886d19be5fec0	leafpad-0.8.18.tar.gz
+sha256	959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c	leafpad-0.8.18.1.tar.gz
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index 6366cab..9551a75 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEAFPAD_VERSION = 0.8.18
+LEAFPAD_VERSION = 0.8.18.1
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
 LEAFPAD_LICENSE = GPLv2+
