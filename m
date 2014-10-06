From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 09:36:04 +0200
Subject: [Buildroot] [git commit] fan-ctrl: add hash file
Message-ID: <20141006073630.0859CB0B99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80498940879b25e22a068b2fa3d8d3c14e815f7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Should avoid autobuilder download issues, and therefore fix issues
such as:

  http://autobuild.buildroot.net/results/afc/afcf6977e7845cf423d3f58d751f762622d84615/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fan-ctrl/fan-ctrl.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fan-ctrl/fan-ctrl.hash b/package/fan-ctrl/fan-ctrl.hash
new file mode 100644
index 0000000..0bd5d60
--- /dev/null
+++ b/package/fan-ctrl/fan-ctrl.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha1 d8ba5bac15e90c36a4e908ca1c98fac83bf702ea fan-ctrl.c?revision=1.3
