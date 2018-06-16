From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 16 Jun 2018 10:16:33 +0200
Subject: [Buildroot] [PATCH 13/34] perl-file-util: add license hash
In-Reply-To: <20180616081654.34649-1-francois.perrad@gadz.org>
References: <20180616081654.34649-1-francois.perrad@gadz.org>
Message-ID: <20180616081654.34649-13-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-file-util/perl-file-util.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/perl-file-util/perl-file-util.hash b/package/perl-file-util/perl-file-util.hash
index dc3e59e32..0915494f7 100644
--- a/package/perl-file-util/perl-file-util.hash
+++ b/package/perl-file-util/perl-file-util.hash
@@ -1,3 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
 md5    5706487ecf0daae885f709914915e832 File-Util-4.161950.tar.gz
 sha256 88507b19da580d595b5c25fe6ba75bbd6096b4359e389ead067a216f766c20ee File-Util-4.161950.tar.gz
+
+# computed by scancpan
+sha256 5f3732812570654ba911e45ec4e5f7353f4b63747ebfc506c543e8fb1ccf797f COPYING
+sha256 48428fd07c402ea82d3556753ca936c7030f0d7a6a93c3ef09423c36820ffb91 LICENSE
-- 
2.17.1
