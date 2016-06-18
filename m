From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:17 +0200
Subject: [Buildroot] [PATCH 17/19] package/libwebsock: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-17-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the libwebsock tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libwebsock/libwebsock.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libwebsock/libwebsock.hash

diff --git a/package/libwebsock/libwebsock.hash b/package/libwebsock/libwebsock.hash
new file mode 100644
index 0000000..b94b738
--- /dev/null
+++ b/package/libwebsock/libwebsock.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 34cf8376446e2371c9af47394043a30dc16af7ed5437d56bc6135c5dfda9ed22  libwebsock-3c1615eeadb0b582b63851073bfe3e5132f31ebc.tar.gz
-- 
2.5.5
