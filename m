From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:32 +0200
Subject: [Buildroot] [git commit] package/erlang-p1-stringprep: add .hash
	file
Message-ID: <20160618131027.E27E2818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a193715bc599e04abc5bad907fba16b564c84ef8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-p1-stringprep tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-stringprep/erlang-p1-stringprep.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
new file mode 100644
index 0000000..23bc6fb
--- /dev/null
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 5a74277e7bfb18b8f35838fa78fcde83f0acdb5b2a5b90c4b6d2470a33f7911e erlang-p1-stringprep-1.0.0.tar.gz
