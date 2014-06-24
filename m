From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:40 -0300
Subject: [Buildroot] [PATCH 34/54] sane-backends: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-34-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sane-backends/sane-backends.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 52c5aa7..6a6fa0b 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -7,6 +7,8 @@
 SANE_BACKENDS_VERSION = 1.0.22
 SANE_BACKENDS_SITE = http://sources.buildroot.net/
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
+SANE_BACKENDS_LICENSE = GPLv2+
+SANE_BACKENDS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb
-- 
1.8.5.5
