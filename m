From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:32 -0300
Subject: [Buildroot] [PATCH 26/54] openocd: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-26-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openocd/openocd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index ac3cd77..24ac0ca 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -7,6 +7,8 @@
 OPENOCD_VERSION = 0.5.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
+OPENOCD_LICENSE = GPLv2+
+OPENOCD_LICENSE_FILES = COPYING
 
 OPENOCD_AUTORECONF = YES
 OPENOCD_CONF_OPT = \
-- 
1.8.5.5
