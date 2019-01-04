From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jan 2019 08:34:05 +0100
Subject: [Buildroot] [git commit] package/libhttpparser: bump version to
 v2.9.0
Message-ID: <20190104073010.48863882A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a02ce33aa5100fb1f51968fae7797e9b0ba23856
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by nodejs v8.15.0+

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libhttpparser/libhttpparser.hash | 2 +-
 package/libhttpparser/libhttpparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhttpparser/libhttpparser.hash b/package/libhttpparser/libhttpparser.hash
index acbf3787f9..b7df9ca602 100644
--- a/package/libhttpparser/libhttpparser.hash
+++ b/package/libhttpparser/libhttpparser.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 51615f68b8d67eadfd2482decc63b3e55d749ce0055502bbb5b0032726d22d96  libhttpparser-v2.8.1.tar.gz
+sha256 ef26268c54c8084d17654ba2ed5140bffeffd2a040a895ffb22a6cca3f6c613f  libhttpparser-v2.9.0.tar.gz
 sha256 79e6ba8b687cb54786207342b9b6fcee0ac10218453ed9009b84d949b2233cc0  LICENSE-MIT
diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
index 502ab75b88..8c0afe2807 100644
--- a/package/libhttpparser/libhttpparser.mk
+++ b/package/libhttpparser/libhttpparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPPARSER_VERSION = v2.8.1
+LIBHTTPPARSER_VERSION = v2.9.0
 LIBHTTPPARSER_SITE = $(call github,nodejs,http-parser,$(LIBHTTPPARSER_VERSION))
 LIBHTTPPARSER_INSTALL_STAGING = YES
 LIBHTTPPARSER_LICENSE = MIT
