From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 20:22:31 +0100
Subject: [Buildroot] [PATCH 2/8] cdrkit: add license informations
In-Reply-To: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358709757-1929-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cdrkit/cdrkit.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index ce89bc7..bade956 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -7,6 +7,8 @@
 CDRKIT_VERSION = 1.1.11
 CDRKIT_SITE = http://www.cdrkit.org/releases
 CDRKIT_DEPENDENCIES = libcap bzip2 zlib
+CDRKIT_LICENSE = GPLv2
+CDRKIT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_ENDIAN),"BIG")
 CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=1
-- 
1.7.9.5
