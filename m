From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 09 Oct 2013 13:58:30 +0200
Subject: [Buildroot] [PATCH 2 of 5] libnetfilter_cthelper: correct license
	GPLv2 -> GPLv2+
In-Reply-To: <patchbomb.1381319908@argentina>
References: <patchbomb.1381319908@argentina>
Message-ID: <56cca55a76b3065d1555.1381319910@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The main file of this package is src/libnetfilter_cthelper.c, which states
GPLv2+.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/libnetfilter_cthelper/libnetfilter-cthelper.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnetfilter_cthelper/libnetfilter-cthelper.mk b/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
--- a/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
+++ b/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
@@ -10,7 +10,7 @@ LIBNETFILTER_CTHELPER_SITE = http://www.
 LIBNETFILTER_CTHELPER_INSTALL_STAGING = YES
 LIBNETFILTER_CTHELPER_DEPENDENCIES = host-pkgconf libmnl
 LIBNETFILTER_CTHELPER_AUTORECONF = YES
-LIBNETFILTER_CTHELPER_LICENSE = GPLv2
+LIBNETFILTER_CTHELPER_LICENSE = GPLv2+
 LIBNETFILTER_CTHELPER_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
