From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:03:12 +0200
Subject: [Buildroot] [git commit] libcurl: add license info
Message-ID: <20120815100418.061D6971A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3934772891113c9584827f92ad7684bd52732d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcurl/libcurl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index d6882fd..090bb4c 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -7,6 +7,8 @@
 LIBCURL_VERSION = 7.25.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
+LIBCURL_LICENSE = ICS
+LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
 LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols
 
