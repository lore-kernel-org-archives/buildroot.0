From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:08 +0200
Subject: [Buildroot] [PATCH 08/19] package/json-javascript: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-8-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the json-javascript tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/json-javascript/json-javascript.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/json-javascript/json-javascript.hash

diff --git a/package/json-javascript/json-javascript.hash b/package/json-javascript/json-javascript.hash
new file mode 100644
index 0000000..6216445
--- /dev/null
+++ b/package/json-javascript/json-javascript.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 1a9dd4429e4bb4929dcb438f9591a3625bc8cc161f840b5f843d8b1d2c8dcfe5  json-javascript-3d7767b6b1f3da363c625ff54e63bbf20e9e83ac.tar.gz
-- 
2.5.5
