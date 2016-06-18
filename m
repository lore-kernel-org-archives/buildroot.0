From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:15 +0200
Subject: [Buildroot] [PATCH 15/19] package/libcli: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-15-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the libcli tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libcli/libcli.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libcli/libcli.hash

diff --git a/package/libcli/libcli.hash b/package/libcli/libcli.hash
new file mode 100644
index 0000000..f6ea12a
--- /dev/null
+++ b/package/libcli/libcli.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3c801cb0112b6b5e07bdc3b98c034b36df6f33a8ed95ce74520b704bdbc0f36d  libcli-c63c9d35144939c8b4fa3c5394aed2e29ff517b0.tar.gz
-- 
2.5.5
