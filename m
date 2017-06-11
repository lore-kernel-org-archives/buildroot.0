From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:29:29 +0200
Subject: [Buildroot] [git commit] package/opkg: add hash
Message-ID: <20170611123755.0A12A7FFED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d9f95f33169f1ab7b68b3c4763b31327bc40e20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opkg/opkg.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
new file mode 100644
index 0000000..80f3f0d
--- /dev/null
+++ b/package/opkg/opkg.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 2ec7157ccf866e49ca139e3632ba1ca9d61dc24382606b55062e423161a530b0  opkg-v0.3.1.tar.gz
