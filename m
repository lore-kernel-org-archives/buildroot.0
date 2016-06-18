From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:48 +0200
Subject: [Buildroot] [git commit] package/luaposix: add .hash file
Message-ID: <20160618131028.B11EC818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d046ee8d0ec8405924bcbd9ed237154315da42b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the luaposix tarball on the autobuilder is
corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o mirror.

Fixes:
http://autobuild.buildroot.net/results/426/426f85021498611e43cdc2af693099b0687de52c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luaposix/luaposix.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
new file mode 100644
index 0000000..e2216be
--- /dev/null
+++ b/package/luaposix/luaposix.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 e66262f5b7fe1c32c65f17a5ef5ffb31c4d1877019b4870a5d373e2ab6526a21 luaposix-33.4.0.tar.gz
