From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 16 Jun 2018 10:16:39 +0200
Subject: [Buildroot] [PATCH 19/34] perl-http-daemon: add license hash
In-Reply-To: <20180616081654.34649-1-francois.perrad@gadz.org>
References: <20180616081654.34649-1-francois.perrad@gadz.org>
Message-ID: <20180616081654.34649-19-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-daemon/perl-http-daemon.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/perl-http-daemon/perl-http-daemon.hash b/package/perl-http-daemon/perl-http-daemon.hash
index f4f602308..f7bf64f63 100644
--- a/package/perl-http-daemon/perl-http-daemon.hash
+++ b/package/perl-http-daemon/perl-http-daemon.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
 md5    ed0ae02d25d7f1e89456d4d69732adc2 HTTP-Daemon-6.01.tar.gz
 sha256 43fd867742701a3f9fcc7bd59838ab72c6490c0ebaf66901068ec6997514adc2 HTTP-Daemon-6.01.tar.gz
+
+# computed by scancpan
+sha256 6a23ab5e150eeab25c21065446beda077352181aa024972ae06965c377f5b15f README
-- 
2.17.1
