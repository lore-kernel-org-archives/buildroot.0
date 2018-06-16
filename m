From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 16 Jun 2018 10:16:49 +0200
Subject: [Buildroot] [PATCH 29/34] perl-timedate: add license hash
In-Reply-To: <20180616081654.34649-1-francois.perrad@gadz.org>
References: <20180616081654.34649-1-francois.perrad@gadz.org>
Message-ID: <20180616081654.34649-29-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-timedate/perl-timedate.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/perl-timedate/perl-timedate.hash b/package/perl-timedate/perl-timedate.hash
index 28a9f078d..234136d0c 100644
--- a/package/perl-timedate/perl-timedate.hash
+++ b/package/perl-timedate/perl-timedate.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
 md5    b1d91153ac971347aee84292ed886c1c TimeDate-2.30.tar.gz
 sha256 75bd254871cb5853a6aa0403ac0be270cdd75c9d1b6639f18ecba63c15298e86 TimeDate-2.30.tar.gz
+
+# computed by scancpan
+sha256 e72e67533eb3ddd705ae718898945e2f3bf3702e91e85bb67824575706bd5bf9 README
-- 
2.17.1
