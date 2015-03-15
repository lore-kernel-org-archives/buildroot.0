From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:13:50 +0100
Subject: [Buildroot] [git commit] bsdiff: Add hash file
Message-ID: <20150315131423.B31D6807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d929b00c52c9ff133c10daf61c66406218f16672
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bsdiff/bsdiff.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bsdiff/bsdiff.hash b/package/bsdiff/bsdiff.hash
new file mode 100644
index 0000000..989fcf1
--- /dev/null
+++ b/package/bsdiff/bsdiff.hash
@@ -0,0 +1,2 @@
+# From http://www.daemonology.net/bsdiff/:
+md5	e6d812394f0e0ecc8d5df255aa1db22a  bsdiff-4.3.tar.gz
