From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 14:25:28 +0200
Subject: [Buildroot] [git commit] package/python-m2crypto: add hash
Message-ID: <20150419122631.67FD97FBCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81e22ebd5ee3b9aa36fcbc86602a8fc5bfe87c17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-m2crypto/python-m2crypto.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
new file mode 100644
index 0000000..a5231ec
--- /dev/null
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -0,0 +1,2 @@
+# From https://pypi.python.org/pypi/M2Crypto/0.21.1
+md5 f93d8462ff7646397a9f77a2fe602d17 M2Crypto-0.21.1.tar.gz
