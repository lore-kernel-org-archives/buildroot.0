From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 22:44:28 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] log4cplus: fix license
Message-ID: <20180524210451.2039080177@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33903687172b915e8607e03a26870a5ff1c8989a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Some files of log4cplus are licensed under BSD-2-Clause as stated in
LICENSE file: "Each file of log4cplus source is licensed using either
two clause BSD license or Apache license 2.0."

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6f5a29e502b0245a3225485b34d6d8525b7b5fb6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
