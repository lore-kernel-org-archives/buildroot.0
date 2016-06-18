From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:51:15 +0200
Subject: [Buildroot] [git commit] package/jquery-datetimepicker: add .hash
	file
Message-ID: <20160618205843.206EB81976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a70ab41f90b87f2ab14897dea6b057afa69e539
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the jquery-datetimepicker tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jquery-datetimepicker/jquery-datetimepicker.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jquery-datetimepicker/jquery-datetimepicker.hash b/package/jquery-datetimepicker/jquery-datetimepicker.hash
new file mode 100644
index 0000000..b6aba87
--- /dev/null
+++ b/package/jquery-datetimepicker/jquery-datetimepicker.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2f362a8acd149d1487a9460942f135d1037f01ee0cbfecba8c352fa2f79c34c9  jquery-datetimepicker-2.4.5.tar.gz
