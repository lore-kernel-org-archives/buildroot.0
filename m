From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 09 Oct 2013 13:58:33 +0200
Subject: [Buildroot] [PATCH 5 of 5] libnetfilter_log: correct license GPLv2
	-> GPLv2+
In-Reply-To: <patchbomb.1381319908@argentina>
References: <patchbomb.1381319908@argentina>
Message-ID: <ccb40b35e63386f0d9df.1381319913@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/libnetfilter_log/libnetfilter-log.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnetfilter_log/libnetfilter-log.mk b/package/libnetfilter_log/libnetfilter-log.mk
--- a/package/libnetfilter_log/libnetfilter-log.mk
+++ b/package/libnetfilter_log/libnetfilter-log.mk
@@ -10,7 +10,7 @@ LIBNETFILTER_LOG_SITE = http://www.netfi
 LIBNETFILTER_LOG_INSTALL_STAGING = YES
 LIBNETFILTER_LOG_DEPENDENCIES = host-pkgconf libnfnetlink
 LIBNETFILTER_LOG_AUTORECONF = YES
-LIBNETFILTER_LOG_LICENSE = GPLv2
+LIBNETFILTER_LOG_LICENSE = GPLv2+
 LIBNETFILTER_LOG_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
