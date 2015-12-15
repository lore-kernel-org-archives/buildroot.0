From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:02:20 +0100
Subject: [Buildroot] [git commit] bc: comma separate licenses
Message-ID: <20151215210843.DA850818FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef36745116c9874ff1b2da2d19e02854ce553129
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bc/bc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 146c472..8f3e08d 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -8,7 +8,7 @@ BC_VERSION = 1.06.95
 BC_SOURCE = bc-$(BC_VERSION).tar.bz2
 BC_SITE = http://alpha.gnu.org/gnu/bc
 BC_DEPENDENCIES = host-flex
-BC_LICENSE = GPLv2+ LGPLv2.1+
+BC_LICENSE = GPLv2+, LGPLv2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
 
 # Build after busybox so target ends up with bc's "dc" version
