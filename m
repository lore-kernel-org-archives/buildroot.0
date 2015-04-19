From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 23:10:30 +0200
Subject: [Buildroot] [git commit] package/sysvinit: add hash
Message-ID: <20150419212235.ACBD07FBF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6603c344a3baa48491b4530e58e3800c5d842fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysvinit/sysvinit.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/sysvinit/sysvinit.hash b/package/sysvinit/sysvinit.hash
new file mode 100644
index 0000000..268b984
--- /dev/null
+++ b/package/sysvinit/sysvinit.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/sysvinit/sysvinit_2.88dsf-13.1%2Bsqueeze1.dsc
+sha256	b016f937958d2809a020d407e1287bdc09abf1d44efaa96530e2ea57f544f4e8	sysvinit_2.88dsf.orig.tar.gz
+sha256	26b456a31036b1e1c2486c22ca2b7fde6d723b7c63669604eacc61cfb6609ef8	sysvinit_2.88dsf-13.1+squeeze1.diff.gz
