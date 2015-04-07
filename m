From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:06:41 +0200
Subject: [Buildroot] [git commit] libxcb: add hash file
Message-ID: <20150407200852.5828A7FCEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e420b53e6ef362163e371506c2a3f9886570faa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/libxcb/libxcb.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.hash b/package/x11r7/libxcb/libxcb.hash
new file mode 100644
index 0000000..e938a5a
--- /dev/null
+++ b/package/x11r7/libxcb/libxcb.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/pipermail/xorg/2014-August/056793.html
+sha256	03635d70045b9ede90778e67516135828a57de87ac508f987024f43c03620ff7	libxcb-1.11.tar.bz2
