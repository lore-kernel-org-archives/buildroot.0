From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:36:09 +0200
Subject: [Buildroot] [git commit] mdadm: add hash file
Message-ID: <20141019153637.B79B4AFC93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=957c36438161234d5071c8e500f6c1afb9b9a10f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mdadm/mdadm.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mdadm/mdadm.hash b/package/mdadm/mdadm.hash
new file mode 100644
index 0000000..45b79dd
--- /dev/null
+++ b/package/mdadm/mdadm.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/raid/mdadm/sha256sums.asc
+sha256	0f3a7e1a76b13892b79f9fceaf99ecb23513260389a768ac644ffa3ae06e5b8c	mdadm-3.3.2.tar.xz
