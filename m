From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 14:34:13 +0200
Subject: [Buildroot] [git commit] package/stella: bump version to 5.0.2
Message-ID: <20170903122654.3EA5381EAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=375cf705b13c68fd4a8c3a7a57dd205ec4f6e5ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/stella/stella.hash | 2 +-
 package/stella/stella.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index 15e75c1..ef17ff7 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 34ff90b60a4d277ada2815c4d65eda18c87371d0fb15e872b8ac82aac3e0b07a  stella-5.0.1-src.tar.xz
+sha256 74ee708b68340b65519a04a22c61921cdcf69a1d308600c212414b28e9e689ac  stella-5.0.2-src.tar.xz
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 7f4e45e..158a511 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 5.0.1
+STELLA_VERSION = 5.0.2
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
