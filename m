From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:16 +0100
Subject: [Buildroot] [PATCH 26/33] igh-ethercat: add license info
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-27-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/igh-ethercat/igh-ethercat.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 9182f76..d37b6d3 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -1,6 +1,10 @@
 IGH_ETHERCAT_VERSION = 1.5.1
 IGH_ETHERCAT_SITE    = http://etherlab.org/download/ethercat/
 IGH_ETHERCAT_SOURCE  = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
+# According to the README file IgH EtherCAT master is licensed under GPLv2,
+# while the source-tree contains a copy of the GPLv2 and one of the LGPLv3
+IGH_ETHERCAT_LICENSE = GPLv2
+IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
 
 IGH_ETHERCAT_DEPENDENCIES    = linux
 IGH_ETHERCAT_INSTALL_STAGING = YES
-- 
1.8.0
