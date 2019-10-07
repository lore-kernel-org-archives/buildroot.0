From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:00:52 +0200
Subject: [Buildroot] [git commit] package/libhttpparser: bump version to
 2.9.2
Message-ID: <20191007205529.23F208295D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd3c08dca3ac4b91f2967a9525b74eb5258c16a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libhttpparser/libhttpparser.hash | 2 +-
 package/libhttpparser/libhttpparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhttpparser/libhttpparser.hash b/package/libhttpparser/libhttpparser.hash
index 13405a8182..a87c0ffa7a 100644
--- a/package/libhttpparser/libhttpparser.hash
+++ b/package/libhttpparser/libhttpparser.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 ef26268c54c8084d17654ba2ed5140bffeffd2a040a895ffb22a6cca3f6c613f  libhttpparser-2.9.0.tar.gz
+sha256 5199500e352584852c95c13423edc5f0cb329297c81dd69c3c8f52a75496da08  libhttpparser-2.9.2.tar.gz
 sha256 79e6ba8b687cb54786207342b9b6fcee0ac10218453ed9009b84d949b2233cc0  LICENSE-MIT
diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
index 97fd3812dd..082fe12767 100644
--- a/package/libhttpparser/libhttpparser.mk
+++ b/package/libhttpparser/libhttpparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPPARSER_VERSION = 2.9.0
+LIBHTTPPARSER_VERSION = 2.9.2
 LIBHTTPPARSER_SITE = $(call github,nodejs,http-parser,v$(LIBHTTPPARSER_VERSION))
 LIBHTTPPARSER_INSTALL_STAGING = YES
 LIBHTTPPARSER_LICENSE = MIT
