From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 14:53:47 +0200
Subject: [Buildroot] [git commit] package/kismet: add hash file
Message-ID: <20160820130045.E49CD81E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ad462aa0f6fe9948233f011b810d3f110eae51b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kismet/kismet.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
new file mode 100644
index 0000000..e4dc5a4
--- /dev/null
+++ b/package/kismet/kismet.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 23b693baa29549b051e95e9d597b115bd94f7267c4677307ebd87f2a00e5a52b kismet-Kismet-2014-02-R1.tar.gz
