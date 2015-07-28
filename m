From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:10 +0200
Subject: [Buildroot] [git commit branch/next] parted: add hash file
Message-ID: <20150808105647.5B7517FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e7489508bd93eb70dde5b8169bdcb2953d3c214
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/parted/parted.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/parted/parted.hash b/package/parted/parted.hash
new file mode 100644
index 0000000..297b5d7
--- /dev/null
+++ b/package/parted/parted.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1082df9b94225ca15	parted-3.1.tar.xz
