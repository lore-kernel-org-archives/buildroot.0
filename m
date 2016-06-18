From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:07 +0200
Subject: [Buildroot] [PATCH 07/19] package/jquery-datetimepicker: add .hash
	file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-7-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the jquery-datetimepicker tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/jquery-datetimepicker/jquery-datetimepicker.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/jquery-datetimepicker/jquery-datetimepicker.hash

diff --git a/package/jquery-datetimepicker/jquery-datetimepicker.hash b/package/jquery-datetimepicker/jquery-datetimepicker.hash
new file mode 100644
index 0000000..b6aba87
--- /dev/null
+++ b/package/jquery-datetimepicker/jquery-datetimepicker.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2f362a8acd149d1487a9460942f135d1037f01ee0cbfecba8c352fa2f79c34c9  jquery-datetimepicker-2.4.5.tar.gz
-- 
2.5.5
