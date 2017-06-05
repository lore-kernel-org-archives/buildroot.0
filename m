From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:15:44 +0200
Subject: [Buildroot] [git commit] package/hiawatha: bump version to 10.6
Message-ID: <20170605091751.720C682158@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6460c31b4f8e78ee59ab384fa1ffcc064abda8c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hiawatha/hiawatha.hash | 2 +-
 package/hiawatha/hiawatha.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index 636dfd5..3ec11cc 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d76155430dc9100de412088bd68978a2a9052832609c7ac961dccaf2550c618a	hiawatha-10.5.tar.gz
+sha256 0cf014ae214be1bf6244c46c25e66805987c948837a4e37f9dede570de49bdeb  hiawatha-10.6.tar.gz
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index f5bdf4b..4dde254 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 10.5
-HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
+HIAWATHA_VERSION = 10.6
+HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
 HIAWATHA_LICENSE_FILES = LICENSE
