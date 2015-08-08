From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:08 -0000
Subject: [Buildroot] [git commit branch/next] c-icap-modules: fix license
	typos
Message-ID: <20150808105638.51A0480414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92f96564d3a5b5c4cd4e20faafb4fdc84df2707d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap-modules/c-icap-modules.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
index 27c57e1..aeab580 100644
--- a/package/c-icap-modules/c-icap-modules.mk
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -7,8 +7,8 @@
 C_ICAP_MODULES_VERSION = 0.3.2
 C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
 C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap/
-C_ICAP_MODULES_LICENCE = GPLv2+
-C_ICAP_MODULES_LICENCE_FILE = COPYING
+C_ICAP_MODULES_LICENSE = GPLv2+
+C_ICAP_MODULES_LICENSE_FILES = COPYING
 C_ICAP_MODULES_DEPENDENCIES = c-icap
 
 C_ICAP_MODULES_CONF_OPTS = \
