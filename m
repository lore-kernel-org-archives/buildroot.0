From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Mar 2015 17:59:22 +0100
Subject: [Buildroot] [git commit] kbd: add hash file
Message-ID: <20150318170028.946447F8FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bea26c80620fcaab0373aa5a9ac2dba2f5a2d5f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kbd/kbd.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
new file mode 100644
index 0000000..c4dfd23
--- /dev/null
+++ b/package/kbd/kbd.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
+sha256	400196f5f51f1900ad2df2c02b61945a72e5ccadd7fb7e1f72b3d89bd33debef	kbd-1.15.5.tar.xz
