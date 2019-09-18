From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 17 Sep 2019 20:35:06 -0500
Subject: [Buildroot] [PATCH] package/bc: remove default value of _SOURCE var
Message-ID: <20190918013506.21430-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

check-package output:
package/bc/bc.mk:8: remove default value of _SOURCE variable

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/295683825

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/bc/bc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 62e692cca1..fdfacb6c89 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 BC_VERSION = 1.07.1
-BC_SOURCE = bc-$(BC_VERSION).tar.gz
 BC_SITE = http://ftp.gnu.org/gnu/bc
 BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.17.1
