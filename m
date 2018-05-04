From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 May 2018 13:26:08 +0200
Subject: [Buildroot] [PATCH 1/1] log4cplus: fix license
Message-ID: <20180504112608.28081-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some files of log4cplus are licensed under BSD-2-Clause as stated in
LICENSE file: "Each file of log4cplus source is licensed using either
two clause BSD license or Apache license 2.0."

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cplus/log4cplus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index 292fa66d49..b4a57c36c3 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -7,7 +7,7 @@
 LOG4CPLUS_VERSION = 1.1.2
 LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
 LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
-LOG4CPLUS_LICENSE = Apache-2.0
+LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause
 LOG4CPLUS_LICENSE_FILES = LICENSE
 LOG4CPLUS_INSTALL_STAGING = YES
 
-- 
2.14.1
