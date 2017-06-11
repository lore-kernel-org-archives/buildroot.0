From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:29:28 +0200
Subject: [Buildroot] [git commit] package/f2fs-tools: add hash
Message-ID: <20170611123753.4BF13805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f176c104825968831e0452938559e280a42fe56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/f2fs-tools/f2fs-tools.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/f2fs-tools/f2fs-tools.hash b/package/f2fs-tools/f2fs-tools.hash
new file mode 100644
index 0000000..36c3b11
--- /dev/null
+++ b/package/f2fs-tools/f2fs-tools.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 aefd2a67e8ddf9db92145dde41b4a697d1c498ff2e113fbfd26ce1efa6cc3f2d  f2fs-tools-v1.8.0.tar.gz
