From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon,  3 Jun 2013 22:03:31 -0400
Subject: [Buildroot] [PATCH 3/7] orc: add license info
In-Reply-To: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
References: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1370311415-1966-3-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/orc/orc.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 77cb29f..84d004e 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -5,6 +5,8 @@
 #############################################################
 ORC_VERSION = 0.4.16
 ORC_SITE = http://code.entropywave.com/download/orc/
+ORC_LICENSE = BSD
+ORC_LICENSE_FILES = COPYING
 ORC_INSTALL_STAGING = YES
 ORC_DEPENDENCIES = host-orc
 
-- 
1.7.9.5
