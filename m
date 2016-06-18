From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:19 +0200
Subject: [Buildroot] [PATCH 19/19] package/libcrossguid: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-19-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the libcrossguid tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libcrossguid/libcrossguid.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libcrossguid/libcrossguid.hash

diff --git a/package/libcrossguid/libcrossguid.hash b/package/libcrossguid/libcrossguid.hash
new file mode 100644
index 0000000..a991da5
--- /dev/null
+++ b/package/libcrossguid/libcrossguid.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 022c9f02cc36e865cd8fd0111a597ff2bd91988deeb348dbe2aba64aed1abd99  libcrossguid-8f399e8bd4252be9952f3dfa8199924cc8487ca4.tar.gz
-- 
2.5.5
