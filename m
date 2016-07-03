From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:54:40 +0200
Subject: [Buildroot] [git commit] fwup: add explicit dependencies for host
	variant
Message-ID: <20160703065521.B556D80434@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd849a10318b0379c59b052889c8cb6e1157c27f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fwup/fwup.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index 0a23856..ae85716 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -9,6 +9,7 @@ FWUP_SITE = $(call github,fhunleth,fwup,$(FWUP_VERSION))
 FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
 FWUP_DEPENDENCIES = libconfuse libarchive libsodium
+HOST_FWUP_DEPENDENCIES = host-libconfuse host-libarchive host-libsodium
 FWUP_AUTORECONF = YES
 FWUP_CONF_ENV = ac_cv_path_HELP2MAN=""
 
