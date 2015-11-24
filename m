From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Nov 2015 17:17:13 +0100
Subject: [Buildroot] [git commit branch/next] micropython: Bump version to
	v1.5
Message-ID: <20151124162105.3766D81E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3d550ddd65682edc45ce388e694951d44fd2db3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/micropython/micropython.hash |    2 ++
 package/micropython/micropython.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
new file mode 100644
index 0000000..24b878e
--- /dev/null
+++ b/package/micropython/micropython.hash
@@ -0,0 +1,2 @@
+#locally computed
+sha256 4ba128def442275ef528c210d8d3dc6d6e12460069a570706b5fbdb6b4a6a25f  micropython-v1.5.tar.gz
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index f5e0ce7..2126f15 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = v1.4.6
+MICROPYTHON_VERSION = v1.5
 MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
