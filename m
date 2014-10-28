From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 22:13:11 +0100
Subject: [Buildroot] [git commit] lttng-tools: bump version
Message-ID: <20141028212859.E4DBEB1DD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ce5e14522c13d85d947a134bbf41bf3610985cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

add hash file

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/lttng-tools.hash |    2 ++
 package/lttng-tools/lttng-tools.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
new file mode 100644
index 0000000..c0c4bc1
--- /dev/null
+++ b/package/lttng-tools/lttng-tools.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256  3c6511e6ceef975cfe36b5644ab9bfaa6780c71b1d2551718279823924429739  lttng-tools-2.5.1.tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index f42fb16..187b851 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.5.0
+LTTNG_TOOLS_VERSION = 2.5.1
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
