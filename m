From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:48:51 +0200
Subject: [Buildroot] [git commit] package/c-periphery: add .hash file
Message-ID: <20160618205842.6E52D7F98D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ff037a1223a5de68a0955984081cdf1ff3be25c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the c-periphery tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-periphery/c-periphery.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
new file mode 100644
index 0000000..516d340
--- /dev/null
+++ b/package/c-periphery/c-periphery.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 5ae4c3f9de0e64d8153ee58b85c4a5defb9f755c6ae215f11b46719bbbac1335  c-periphery-v1.0.3.tar.gz
