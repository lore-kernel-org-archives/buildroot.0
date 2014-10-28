From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 22:12:31 +0100
Subject: [Buildroot] [git commit] lttng-babeltrace: bump version
Message-ID: <20141028212859.BCDA2B1E0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f6d0f6aea0b499a53ddcf53c2652ddc05f957e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-babeltrace/lttng-babeltrace.hash |    7 +++++++
 package/lttng-babeltrace/lttng-babeltrace.mk   |    2 +-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.hash b/package/lttng-babeltrace/lttng-babeltrace.hash
new file mode 100644
index 0000000..51e3a2c
--- /dev/null
+++ b/package/lttng-babeltrace/lttng-babeltrace.hash
@@ -0,0 +1,7 @@
+# From http://lttng.org/files/babeltrace/babeltrace-1.2.3.tar.bz2.md5
+md5     c35b480304ba34aacbfb3934182cdd21  babeltrace-1.2.3.tar.bz2
+# From http://lttng.org/files/babeltrace/babeltrace-1.2.3.tar.bz2.sha1
+sha1    55d3ad8fb5df4ff025e063a0993be1667bfc6554  babeltrace-1.2.3.tar.bz2
+# Locally generated
+sha256  796fa6978102244d9c64d474baeac4e4292a0186660a53cf58f20d47226987ac  babeltrace-1.2.3.tar.bz2
+
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 3785812..1fd2f8b 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_BABELTRACE_SITE = http://lttng.org/files/babeltrace
-LTTNG_BABELTRACE_VERSION = 1.2.2
+LTTNG_BABELTRACE_VERSION = 1.2.3
 LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT; LGPLv2.1 for include/babeltrace/list.h; GPLv2 for test code
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
