From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 20:44:58 +0100
Subject: [Buildroot] [git commit] package/erlang-eimp: bump to version 1.0.12
Message-ID: <20200106201550.15BC98EE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0f8a3531934fb74e8cc457b76ca79e344c417d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it, add the hash file which was missing.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-eimp/erlang-eimp.hash | 2 ++
 package/erlang-eimp/erlang-eimp.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/erlang-eimp/erlang-eimp.hash b/package/erlang-eimp/erlang-eimp.hash
new file mode 100644
index 0000000000..2b16ba5e57
--- /dev/null
+++ b/package/erlang-eimp/erlang-eimp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 dfcdc211480f974175af615616c7f8c1e8f9dff5d6be5faa3f20c3eb4c60240e erlang-eimp-1.0.12.tar.gz
diff --git a/package/erlang-eimp/erlang-eimp.mk b/package/erlang-eimp/erlang-eimp.mk
index 83d34cd5e0..c8cea0e429 100644
--- a/package/erlang-eimp/erlang-eimp.mk
+++ b/package/erlang-eimp/erlang-eimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_EIMP_VERSION = 1.0.8
+ERLANG_EIMP_VERSION = 1.0.12
 ERLANG_EIMP_SITE = $(call github,processone,eimp,$(ERLANG_EIMP_VERSION))
 ERLANG_EIMP_LICENSE = Apache-2.0
 ERLANG_EIMP_LICENSE_FILES = LICENSE.txt
