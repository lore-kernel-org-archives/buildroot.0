From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Sep 2017 23:55:40 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libcurl: bump version to
	7.54.1
Message-ID: <20170905220138.E61C481ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fea005f3c2717e5d8443ac8e41ef8349740a7948
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit c52d50336eb6c51eb9d590cebdee72623d76dd51)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index f8885e0..1b8d80f 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 f50ebaf43c507fa7cc32be4b8108fa8bbd0f5022e90794388f3c7694a302ff06  curl-7.54.0.tar.bz2
+sha256 fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0  curl-7.54.1.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 6f4803e..45bd080 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.54.0
+LIBCURL_VERSION = 7.54.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
