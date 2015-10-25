From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:41:15 +0100
Subject: [Buildroot] [git commit] supervisor: bump to version 3.1.3
Message-ID: <20151025205127.AAB13819F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee865a59529e19637ed1b050465b5a0ebf403bcc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And also add a hash file.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/supervisor/supervisor.hash |    2 ++
 package/supervisor/supervisor.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/supervisor/supervisor.hash b/package/supervisor/supervisor.hash
new file mode 100644
index 0000000..03f337e
--- /dev/null
+++ b/package/supervisor/supervisor.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 e32c546fe8d2a6e079ec4819c49fd24534d4075a58af39118d04367918b3c282  supervisor-3.1.3.tar.gz
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index a6a4731..d3c250f 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUPERVISOR_VERSION = 3.0a12
+SUPERVISOR_VERSION = 3.1.3
 SUPERVISOR_SITE = http://pypi.python.org/packages/source/s/supervisor
 SUPERVISOR_LICENSE_FILES = LICENSES.txt
 SUPERVISOR_SETUP_TYPE = setuptools
