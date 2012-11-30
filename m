From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 30 Nov 2012 10:14:37 +0000
Subject: [Buildroot] [PATCH 2/8] argus: add license information
In-Reply-To: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
References: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
Message-ID: <1354270483-32356-3-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/argus/argus.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index da7ecac..a4b5330 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -8,6 +8,8 @@ ARGUS_SOURCE:=argus_$(ARGUS_VERSION).orig.tar.gz
 ARGUS_PATCH:=argus_$(ARGUS_VERSION)-1.diff.gz
 ARGUS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/a/argus/
 ARGUS_DEPENDENCIES=libpcap
+ARGUS_LICENSE = GPLv2+
+ARGUS_LICENSE_FILES = COPYING
 
 define ARGUS_DEBIAN_PATCH_APPLY
 	if [ -d $(@D)/debian/patches ]; then \
-- 
1.7.10.4
