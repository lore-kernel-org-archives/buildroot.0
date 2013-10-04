From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 04 Oct 2013 16:09:59 +0800
Subject: [Buildroot] [PATCH 2/2] dmidecode: add license info
In-Reply-To: <1380874152.7626.2.camel@phoenix>
References: <1380874152.7626.2.camel@phoenix>
Message-ID: <1380874199.7626.3.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/dmidecode/dmidecode.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index c53bd33..32e7ff2 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -6,6 +6,8 @@
 
 DMIDECODE_VERSION = 2.12
 DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode/
+DMIDECODE_LICENSE = GPLv2+
+DMIDECODE_LICENSE_FILES = LICENSE
 
 define DMIDECODE_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
-- 
1.8.1.2
