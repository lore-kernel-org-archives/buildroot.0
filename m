From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 May 2010 21:55:42 +0200
Subject: [Buildroot] [git commit master] cairo: ps backend needs pdf
Message-ID: <20100522195607.E119D12DEF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1a859442355aee413d61836b5cbc00c31a3f5599
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cairo/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index e19efb5..752f615 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -16,6 +16,7 @@ if BR2_PACKAGE_CAIRO
 config BR2_PACKAGE_CAIRO_PS
 	bool "postscript support"
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_CAIRO_PDF
 
 config BR2_PACKAGE_CAIRO_PDF
 	bool "pdf support"
-- 
1.6.3.3
