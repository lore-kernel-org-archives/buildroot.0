From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:49 +0530
Subject: [Buildroot] [PATCH 20/21] scripts/scancpan: use SPDX short
	identifier for license
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-21-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
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
-- 
2.6.2
