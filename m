From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jan 2017 09:23:57 +0100
Subject: [Buildroot] [git commit] udoo: mx6qdl: Use the preferred form for
	disabling a symbol
Message-ID: <20170101082411.0366381A1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=027d8141c56d03a7bbaad3c5242c1263454b10b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though 'CONFIG_USB=n' does the job, let's switch to the more
standard way for disabling a Kconfig symbol.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/udoo/mx6qdl/linux.fragment | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/udoo/mx6qdl/linux.fragment b/board/udoo/mx6qdl/linux.fragment
index 2acad15..1d25099 100644
--- a/board/udoo/mx6qdl/linux.fragment
+++ b/board/udoo/mx6qdl/linux.fragment
@@ -1 +1 @@
-CONFIG_USB=n
+# CONFIG_USB is not set
