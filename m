From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Mon,  7 Jan 2013 14:30:15 +0100
Subject: [Buildroot] [PATCH 3/5] gnuplot : move under "Graphic applications"
	section
In-Reply-To: <1357565417-16782-1-git-send-email-viallard@syscom-instruments.com>
References: <1357565417-16782-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <1357565417-16782-3-git-send-email-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gnuplot isn't a "Development tools".

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 package/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index eb18543..63d8ecb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -70,7 +70,6 @@ endif
 source "toolchain/gcc/Config.in.2"
 source "package/gettext/Config.in"
 source "package/gmp/Config.in"
-source "package/gnuplot/Config.in"
 source "package/gperf/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/grep/Config.in"
@@ -109,6 +108,7 @@ menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
 source "package/rrdtool/Config.in"
+source "package/gnuplot/Config.in"
 
 comment "graphic libraries"
 source "package/directfb/Config.in"
-- 
1.7.10.4
