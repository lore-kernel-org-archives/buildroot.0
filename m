From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 16 Jun 2018 10:16:29 +0200
Subject: [Buildroot] [PATCH 09/34] perl-digest-sha1: add license hash
In-Reply-To: <20180616081654.34649-1-francois.perrad@gadz.org>
References: <20180616081654.34649-1-francois.perrad@gadz.org>
Message-ID: <20180616081654.34649-9-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-digest-sha1/perl-digest-sha1.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/perl-digest-sha1/perl-digest-sha1.hash b/package/perl-digest-sha1/perl-digest-sha1.hash
index d24d5ab66..bfc94a12a 100644
--- a/package/perl-digest-sha1/perl-digest-sha1.hash
+++ b/package/perl-digest-sha1/perl-digest-sha1.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
 md5    bd22388f268434f2b24f64e28bf1aa35 Digest-SHA1-2.13.tar.gz
 sha256 68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ededf5b90296fb943cc Digest-SHA1-2.13.tar.gz
+
+# computed by scancpan
+sha256 805bee77fab9c72b0bfb452bb623b278f1767de62011e1814de2a6f6115439c8 README
-- 
2.17.1
