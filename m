From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Mar 2015 17:59:21 +0100
Subject: [Buildroot] [git commit] haveged: add hash file
Message-ID: <20150318170028.836BA7F8FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=979a13fe629868917d7c9c1b6e73d867058317bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/haveged/haveged.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
new file mode 100644
index 0000000..d1133b6
--- /dev/null
+++ b/package/haveged/haveged.hash
@@ -0,0 +1,2 @@
+# From http://www.issihosts.com/haveged/verify/haveged-1.9.1.sha1
+sha1	ab7234b7f57dbb7d500a5ab3cbf0494715ce6499	haveged-1.9.1.tar.gz
