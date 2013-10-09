From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 09 Oct 2013 13:58:31 +0200
Subject: [Buildroot] [PATCH 3 of 5] libnetfilter_cttimeout: correct license
	GPLv2 -> GPLv2+
In-Reply-To: <patchbomb.1381319908@argentina>
References: <patchbomb.1381319908@argentina>
Message-ID: <206d3e7929e035bd5b5d.1381319911@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
--- a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
+++ b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
@@ -10,7 +10,7 @@ LIBNETFILTER_CTTIMEOUT_SITE = http://www
 LIBNETFILTER_CTTIMEOUT_INSTALL_STAGING = YES
 LIBNETFILTER_CTTIMEOUT_DEPENDENCIES = host-pkgconf libmnl
 LIBNETFILTER_CTTIMEOUT_AUTORECONF = YES
-LIBNETFILTER_CTTIMEOUT_LICENSE = GPLv2
+LIBNETFILTER_CTTIMEOUT_LICENSE = GPLv2+
 LIBNETFILTER_CTTIMEOUT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
