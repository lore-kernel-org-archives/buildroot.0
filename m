From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 14:19:52 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: update the upstream URL
 in Config.in
Message-ID: <20191222131049.192EC8D5BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a31c20c86c0e8ae71e39e7a46f94fc9e559c410
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/syslog-ng/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index a537115616..30ad54a4bf 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	  of input and output methods: syslog, unstructured text,
 	  queueing, SQL & NoSQL
 
-	  https://syslog-ng.org/
+	  https://www.syslog-ng.com/products/open-source-log-management/
 
 comment "syslog-ng needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
