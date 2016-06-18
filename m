From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:10:50 +0200
Subject: [Buildroot] [git commit] package/ne10: add .hash file
Message-ID: <20160618211721.64BF581963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99bbfd7dbd7a5bb8aee0e6f7ef781af93cbada7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the ne10 tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ne10/ne10.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ne10/ne10.hash b/package/ne10/ne10.hash
new file mode 100644
index 0000000..db5b6f1
--- /dev/null
+++ b/package/ne10/ne10.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 450dac5bb3a2351019ae23792e97c3bf965d16a21c0598b73cea9fbc3b3a56af  ne10-v1.2.0.tar.gz
