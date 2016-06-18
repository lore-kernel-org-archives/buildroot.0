From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:30 +0200
Subject: [Buildroot] [git commit] package/erlang-p1-sip: add .hash file
Message-ID: <20160618131027.CC746818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=849a7d6332718a5c127563ba2942669e6ea15680
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-p1-sip tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-sip/erlang-p1-sip.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
new file mode 100644
index 0000000..74382cc
--- /dev/null
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2d6dfad997931668eb83a0cb127ccca8c51f8a383d76f9dea393c0b3a4eabae7 erlang-p1-sip-1.0.0.tar.gz
