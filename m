From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:03:02 +0200
Subject: [Buildroot] [git commit] libfcgi: add license info
Message-ID: <20120815100417.BF2E1971A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52a46f8330a18213e113423e9e4fc726e01a86a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfcgi/libfcgi.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index 1aa2c5a..a4d18a4 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -6,6 +6,8 @@
 LIBFCGI_VERSION = 2.4.0
 LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
 LIBFCGI_SITE = http://www.fastcgi.com/dist
+LIBFCGI_LICENSE = fcgi license
+LIBFCGI_LICENSE_FILES = LICENSE.TERMS
 LIBFCGI_INSTALL_STAGING = YES
 LIBFCGI_AUTORECONF = YES
 
