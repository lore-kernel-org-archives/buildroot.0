From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:35:22 +0200
Subject: [Buildroot] [git commit] libidn: add hash file
Message-ID: <20141019153637.6BE41AF9BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb35656000427f38e3348d9f44a805c1019d640b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libidn/libidn.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
new file mode 100644
index 0000000..f486626
--- /dev/null
+++ b/package/libidn/libidn.hash
@@ -0,0 +1,2 @@
+# From https://lists.gnu.org/archive/html/info-gnu/2014-08/msg00006.html
+sha256	fb82747dbbf9b36f703ed27293317d818d7e851d4f5773dedf3efa4db32a7c7c	libidn-1.29.tar.gz
