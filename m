From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Sep 2019 17:53:25 +0200
Subject: [Buildroot] [git commit] package/bc: remove default value of
 _SOURCE var
Message-ID: <20190918154847.040E28EB43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b5e835dcd58c652021147eaddf89b5536d40d49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package output:
package/bc/bc.mk:8: remove default value of _SOURCE variable

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/295683825

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
