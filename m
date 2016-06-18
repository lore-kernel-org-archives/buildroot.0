From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:15:43 +0200
Subject: [Buildroot] [git commit] package/rapidjson: add .hash file
Message-ID: <20160618211721.EAF3981963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c5484cb1e93326777985e1eb494f2f99891cfce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the rapidjson tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rapidjson/rapidjson.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rapidjson/rapidjson.hash b/package/rapidjson/rapidjson.hash
new file mode 100644
index 0000000..baaced9
--- /dev/null
+++ b/package/rapidjson/rapidjson.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 c3711ed2b3c76a5565ee9f0128bb4ec6753dbcc23450b713842df8f236d08666  rapidjson-v1.0.2.tar.gz
