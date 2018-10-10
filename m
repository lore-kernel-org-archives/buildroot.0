From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 09:06:21 +0200
Subject: [Buildroot] [git commit] perl-*: regeneration of hash files
Message-ID: <20181010070555.D6A0D81E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=991a9c6d93ce1120d6ac612f40e7c181e1296e53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mailtools/perl-mailtools.hash | 5 +++--
 package/perl-net-http/perl-net-http.hash   | 5 +++--
 package/perl-sys-mmap/perl-sys-mmap.hash   | 2 +-
 package/perl-uri/perl-uri.hash             | 5 +++--
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/perl-mailtools/perl-mailtools.hash b/package/perl-mailtools/perl-mailtools.hash
index 9fb91cbd26..1db4772f56 100644
--- a/package/perl-mailtools/perl-mailtools.hash
+++ b/package/perl-mailtools/perl-mailtools.hash
@@ -1,5 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
 md5    53e9d35256c3fd7cef0e4a24b15e9512 MailTools-2.20.tar.gz
 sha256 f55606f7a9cc342ee9d5f996e2b6a4c0047e2ee47cd88c3250ecf0d0c5fb3196 MailTools-2.20.tar.gz
-# Locally computed
-sha256 734d5b1bd212de832aea99e94c98d56217ea9519d900a29c0547538f596a9b26  README
+
+# computed by scancpan
+sha256 734d5b1bd212de832aea99e94c98d56217ea9519d900a29c0547538f596a9b26 README
diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 21cd6308f2..0dd9964953 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,5 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
 md5    6da11a7db0e933b7684148e1fb32006a Net-HTTP-6.18.tar.gz
 sha256 7e42df2db7adce3e0eb4f78b88c450f453f5380f120fd5411232e03374ba951c Net-HTTP-6.18.tar.gz
-# Locally computed
-sha256 49fbcc80e17295888b909176a0029f275a8c17b6cbfaf8867fe571ebe9a9ca79  LICENSE
+
+# computed by scancpan
+sha256 49fbcc80e17295888b909176a0029f275a8c17b6cbfaf8867fe571ebe9a9ca79 LICENSE
diff --git a/package/perl-sys-mmap/perl-sys-mmap.hash b/package/perl-sys-mmap/perl-sys-mmap.hash
index caeea3d965..d50fb717d1 100644
--- a/package/perl-sys-mmap/perl-sys-mmap.hash
+++ b/package/perl-sys-mmap/perl-sys-mmap.hash
@@ -3,5 +3,5 @@ md5    990c9106a88dc843035f7bcb109e6c0e Sys-Mmap-0.19.tar.gz
 sha256 09295e25cc9b0599d9009d19b2be89fcecaecc62ce594f873d7f70d7c10900fa Sys-Mmap-0.19.tar.gz
 
 # computed by scancpan
-sha256 51c144e9a67644fa8eea0ea63dedb4e837587305b22f073eb5e279e39e7325a8 Copying
 sha256 4ac2afe465736476a06e52edcc78c72cfa0fa4d625916e58ab4f2af6c598709c Artistic
+sha256 51c144e9a67644fa8eea0ea63dedb4e837587305b22f073eb5e279e39e7325a8 Copying
diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index c8bf47d437..4ef17ece64 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,5 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
 md5    892f7183b178af40f205ba37128225db URI-1.74.tar.gz
 sha256 a9c254f45f89cb1dd946b689dfe433095404532a4543bdaab0b71ce0fdcdd53d URI-1.74.tar.gz
-# Locally computed
-sha256 65cd6f88516a30f56fd4e0080fb78ea69424fc89067470dc994e4abfba08664e  LICENSE
+
+# computed by scancpan
+sha256 65cd6f88516a30f56fd4e0080fb78ea69424fc89067470dc994e4abfba08664e LICENSE
