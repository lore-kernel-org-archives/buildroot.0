From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 14:25:10 +0200
Subject: [Buildroot] [git commit] package/cvs: add hash
Message-ID: <20150419122631.4BB7681918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6311723c4fbf49360aa97ceed6c8a359d68e7d95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cvs/cvs.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/cvs/cvs.hash b/package/cvs/cvs.hash
new file mode 100644
index 0000000..b386d88
--- /dev/null
+++ b/package/cvs/cvs.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs/cvs_1.12.13-12%2Bsqueeze1.dsc
+sha256	b5961c2476b996e5758fa5e22b60af085adca41164cac0d8f68a1d3b49d4e4f1	cvs_1.12.13.orig.tar.gz
+sha256	d52a9232d9cf36302a150d782fc7e5b6f92f8115505ae8a7dc6acfc83e809d2f	cvs_1.12.13-12+squeeze1.diff.gz
