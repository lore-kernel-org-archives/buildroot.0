From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:02:12 +0100
Subject: [Buildroot] [git commit] gdb: comma separate licenses
Message-ID: <20151215210843.BD17880409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=388c4ef06d4a3ba27d0971979eb30dc9c3d6c4f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 15f394c..3b0f501 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -23,7 +23,7 @@ ifneq ($(filter 7.7.%,$(GDB_VERSION)),)
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
 endif
 
-GDB_LICENSE = GPLv2+ LGPLv2+ GPLv3+ LGPLv3+
+GDB_LICENSE = GPLv2+, LGPLv2+, GPLv3+, LGPLv3+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
 # We only want gdbserver and not the entire debugger.
