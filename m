From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:44 -0300
Subject: [Buildroot] [PATCH 38/54] sredird: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-38-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sredird/sredird.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
index afb2dff..0a0f398 100644
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -7,6 +7,8 @@
 SREDIRD_VERSION = 2.2.1-1.1
 SREDIRD_SOURCE = sredird_$(SREDIRD_VERSION).tar.gz
 SREDIRD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sredird
+SREDIRD_LICENSE = GPLv2+
+SREDIRD_LICENSE_FILES = COPYING
 
 define SREDIRD_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
1.8.5.5
