From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 15:56:15 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libcurl: bump version to
	7.53.1
Message-ID: <20170424193337.1489F821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56938a2feb5c8159ee4569c1b0699dfb8628f4bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 07db6fa6e83560a6901a74685024d45872da68d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 72cae81..9c521e9 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 b2345a8bef87b4c229dedf637cb203b5e21db05e20277c8e1094f0d4da180801  curl-7.53.0.tar.bz2
+sha256 1c7207c06d75e9136a944a2e0528337ce76f15b9ec9ae4bb30d703b59bf530e8  curl-7.53.1.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index b5dcb37..0249f5c 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.53.0
+LIBCURL_VERSION = 7.53.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
