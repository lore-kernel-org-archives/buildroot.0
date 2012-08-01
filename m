From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  1 Aug 2012 07:48:59 +0300
Subject: [Buildroot] [PATCH 3/3] ebtables: add license information
In-Reply-To: <5d40aa0e8f5d5dc6b863bf1a0af427a377e75989.1343796460.git.baruch@tkos.co.il>
References: <5d40aa0e8f5d5dc6b863bf1a0af427a377e75989.1343796460.git.baruch@tkos.co.il>
Message-ID: <8ed73faa3bc5d3cf00af348d5733252737446ed8.1343796460.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ebtables/ebtables.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index b3068f4..7676e9a 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -7,6 +7,8 @@
 EBTABLES_VERSION = 2.0.10-4
 EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
 EBTABLES_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ebtables
+EBTABLES_LICENSE = GPLv2
+EBTABLES_LICENSE_FILES = COPYING
 
 define EBTABLES_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) LIBDIR=/lib/ebtables -C $(@D)
-- 
1.7.10.4
