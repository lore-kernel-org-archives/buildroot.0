From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Tue, 30 Dec 2014 03:07:24 +0100
Subject: [Buildroot] [PATCH 2/2] sane-backends: Install into staging
In-Reply-To: <1419905244-7418-1-git-send-email-nerv@dawncrow.de>
References: <1419905244-7418-1-git-send-email-nerv@dawncrow.de>
Message-ID: <1419905244-7418-2-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/sane-backends/sane-backends.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index ab40993..9e8d3d4 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -6,6 +6,7 @@
 
 SANE_BACKENDS_VERSION = 1.0.22
 SANE_BACKENDS_SITE = http://sources.buildroot.net
+SANE_BACKENDS_INSTALL_STAGING = YES
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPLv2+
 SANE_BACKENDS_LICENSE_FILES = COPYING
-- 
1.9.1
