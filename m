From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 19:19:26 +0100
Subject: [Buildroot] [PATCH 5/9] neon: add license informations
In-Reply-To: <1364149170-5521-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364149170-5521-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364149170-5521-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/neon/neon.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index cec72f8..58e01e1 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -5,6 +5,8 @@
 #############################################################
 NEON_VERSION = 0.29.6
 NEON_SITE = http://www.webdav.org/neon/
+NEON_LICENSE = LGPLv2+ (library), GPLv2+ (manual and tests)
+NEON_LICENSE_FILES = src/COPYING.LIB src/COPYING README
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPT = --without-gssapi --disable-rpath
 NEON_CONFIG_SCRIPTS = neon-config
-- 
1.7.9.5
