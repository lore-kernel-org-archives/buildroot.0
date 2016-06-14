From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 14 Jun 2016 20:47:44 +0200
Subject: [Buildroot] [PATCH] scancpan: fix doc
Message-ID: <1465930064-19189-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

we need to install a host perl with the same version as our target perl

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 6c70cfb..c2aa2e9 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -748,7 +748,7 @@ support/scripts/scancpan Try-Tiny Moo
 
 curl -kL http://install.perlbrew.pl | bash
 
-perlbrew install perl-5.18.2
+perlbrew install perl-5.22.2
 
 supports/scripts/scancpan [options] [distname ...]
 
-- 
1.9.1
