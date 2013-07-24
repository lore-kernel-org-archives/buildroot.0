From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Jul 2013 12:34:31 +0200
Subject: [Buildroot] [PATCH 1 of 2] bind: install to staging
In-Reply-To: <patchbomb.1374662070@BEANTN0L019720>
References: <patchbomb.1374662070@BEANTN0L019720>
Message-ID: <d44ee681747ae24a4cb1.1374662071@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install bind to staging so other applications can use its include files
and libraries.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/bind/bind.mk |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -7,6 +7,7 @@
 BIND_VERSION = 9.6-ESV-R9-P1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
+BIND_INSTALL_STAGING = YES
 BIND_LICENSE = ISC
 BIND_LICENSE_FILES = COPYRIGHT
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
