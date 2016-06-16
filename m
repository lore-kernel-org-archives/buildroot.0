From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:05:46 +0200
Subject: [Buildroot] [git commit] luaexpatutils: add .hash file
Message-ID: <20160616200655.6F01881FD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8439cf81f5aafd031ef4e01d3c7013d31f8f37f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/4f6/4f6439f421809090c874e24055348e3f30b2e2b0/
http://autobuild.buildroot.org/results/bd4/bd4a1db0136ee65f325d1fd9826dedb23986134d/

Similar to jquery-keyboard, it seems the luaexpatutiles tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luaexpatutils/luaexpatutils.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luaexpatutils/luaexpatutils.hash b/package/luaexpatutils/luaexpatutils.hash
new file mode 100644
index 0000000..fe32eea
--- /dev/null
+++ b/package/luaexpatutils/luaexpatutils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9b50bef94a6ddb6e6d4fffd5392f5c53d15e1a048966b559c4f8eda5e84d4517  luaexpatutils-88c228365b084224c911d34aff06002634b38b50.tar.gz
