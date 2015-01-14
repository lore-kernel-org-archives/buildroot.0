From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:45:46 +0100
Subject: [Buildroot] [git commit] dtc: add hash
Message-ID: <20150114194650.A7F358081A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6723a73e4b9f8844decbdb654f1f2faf0ebef376
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dtc/dtc.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
new file mode 100644
index 0000000..8b3af33
--- /dev/null
+++ b/package/dtc/dtc.hash
@@ -0,0 +1,2 @@
+# from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
+sha256 77992ad8eac7b68f553d0ba58e5b51604ac803d126196c99e3ae38aaae28bb94  dtc-1.4.1.tar.xz
