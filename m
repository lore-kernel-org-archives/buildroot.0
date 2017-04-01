From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:35:14 +0200
Subject: [Buildroot] [git commit] scripts/scancpan: use SPDX short
	identifier for license
Message-ID: <20170401134426.40A8C8261E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e261d807f3fb20fac23f87ae338df1717688fa9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scancpan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index b6123de..8d44ed9 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -688,7 +688,7 @@ while (my ($distname, $dist) = each %dist) {
         $license =~ s|artistic_2|Artistic-2.0|;
         $license =~ s|mit|MIT|;
         $license =~ s|openssl|OpenSSL|;
-        $license =~ s|perl_5|Artistic or GPLv1+|;
+        $license =~ s|perl_5|Artistic or GPL-1.0+|;
         my $license_files = join q{ }, @{$license_files{$distname}};
         say qq{write ${mkname}} unless $quiet;
         open my $fh, q{>}, $mkname;
