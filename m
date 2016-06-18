From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:46 +0200
Subject: [Buildroot] [git commit] package/erlang-rebar: add .hash file
Message-ID: <20160618131028.9C3AA818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db1ccb780ef1835907b9e5ce50b084e2bd8c96e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-rebar tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-rebar/erlang-rebar.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-rebar/erlang-rebar.hash b/package/erlang-rebar/erlang-rebar.hash
new file mode 100644
index 0000000..029b52c
--- /dev/null
+++ b/package/erlang-rebar/erlang-rebar.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 aed933d4e60c4f11e0771ccdb4434cccdb9a71cf8b1363d17aaf863988b3ff60 erlang-rebar-2.6.1.tar.gz
