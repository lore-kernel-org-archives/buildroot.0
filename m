From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  1 Oct 2014 20:36:58 +0200
Subject: [Buildroot] [PATCH 2/3] perl: add hash
In-Reply-To: <1412188619-3981-1-git-send-email-francois.perrad@gadz.org>
References: <1412188619-3981-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1412188619-3981-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/perl/perl.hash

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
new file mode 100644
index 0000000..57fefd7
--- /dev/null
+++ b/package/perl/perl.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.20.1.tar.bz2.{md5,sha1,sha256}.txt
+md5    ede5166f949d9a07163bc5b086be9759                                 perl-5.20.1.tar.bz2
+sha1   cd424d1520ba2686fe5d4422565aaf880e9467f6                         perl-5.20.1.tar.bz2
+sha256 ede5ded37e7fb6139b04728cfca826f17076f9888dbfd100a56834dbeb04657c perl-5.20.1.tar.bz2
-- 
1.9.1
