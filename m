From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 19:32:33 +0200
Subject: [Buildroot] [PATCH 11/11] package/rapidjson: add .hash file
In-Reply-To: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
References: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466271153-18961-11-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the rapidjson tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/rapidjson/rapidjson.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/rapidjson/rapidjson.hash

diff --git a/package/rapidjson/rapidjson.hash b/package/rapidjson/rapidjson.hash
new file mode 100644
index 0000000..baaced9
--- /dev/null
+++ b/package/rapidjson/rapidjson.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 c3711ed2b3c76a5565ee9f0128bb4ec6753dbcc23450b713842df8f236d08666  rapidjson-v1.0.2.tar.gz
-- 
2.5.5
