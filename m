From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:56:51 +0200
Subject: [Buildroot] [git commit] package/libwebsock: add .hash file
Message-ID: <20160618205843.C8ACB7FCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23d795ebe326dec8b9c59d68e6d658a3f425472d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the libwebsock tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwebsock/libwebsock.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libwebsock/libwebsock.hash b/package/libwebsock/libwebsock.hash
new file mode 100644
index 0000000..b94b738
--- /dev/null
+++ b/package/libwebsock/libwebsock.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 34cf8376446e2371c9af47394043a30dc16af7ed5437d56bc6135c5dfda9ed22  libwebsock-3c1615eeadb0b582b63851073bfe3e5132f31ebc.tar.gz
