From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 15 Feb 2015 21:35:34 +0100
Subject: [Buildroot] [PATCH 04/12] perl-gd: add hash file
In-Reply-To: <1424032542-3981-1-git-send-email-francois.perrad@gadz.org>
References: <1424032542-3981-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1424032542-3981-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-gd/perl-gd.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/perl-gd/perl-gd.hash

diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
new file mode 100644
index 0000000..c6822ae
--- /dev/null
+++ b/package/perl-gd/perl-gd.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    d2c9b18123bcaff8672eb50f2eb37ed3 GD-2.53.tar.gz
+sha256 d05d01fe95e581adb3468cf05ab5d405db7497c0fb3ec7ecf23d023705fab7aa GD-2.53.tar.gz
-- 
2.1.0
