From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:13:50 +0100
Subject: [Buildroot] [git commit] botan: Add hash file
Message-ID: <20150315131423.9760A805EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1653db92f7ed946cf7c3fc49a100ff3583e0d26b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/botan/botan.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
new file mode 100644
index 0000000..ab8788e
--- /dev/null
+++ b/package/botan/botan.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	c2cdb47a8b1ac2368de5b9c51a8fab2a72a5641fbc1afd1abe81d5c6e4197420  Botan-1.10.8.tgz
