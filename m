From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Jul 2014 17:00:36 -0300
Subject: [Buildroot] [PATCH 1/4] at: add license information
Message-ID: <1404417639-5879-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/at/at.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/at/at.mk b/package/at/at.mk
index 0fe5b9a..f09548d 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -11,6 +11,8 @@ AT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
 AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
+AT_LICENSE = GPLv2+
+AT_LICENSE_FILES = Copyright
 
 AT_CONF_OPT = \
         --with-jobdir=/var/spool/cron/atjobs \
-- 
1.8.5.5
