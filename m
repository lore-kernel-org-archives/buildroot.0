From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 08 Oct 2013 12:06:58 +0200
Subject: [Buildroot] [PATCH 4 of 4] ebtables: correct license GPLv2 -> GPLv2+
In-Reply-To: <patchbomb.1381226814@argentina>
References: <patchbomb.1381226814@argentina>
Message-ID: <3d806cab04ae59f1e953.1381226818@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/ebtables/ebtables.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -7,7 +7,7 @@
 EBTABLES_VERSION = 2.0.10-4
 EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
 EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-$(subst .,-,$(EBTABLES_VERSION))
-EBTABLES_LICENSE = GPLv2
+EBTABLES_LICENSE = GPLv2+
 EBTABLES_LICENSE_FILES = COPYING
 EBTABLES_STATIC = $(if $(BR2_PREFER_STATIC_LIB),static)
 
