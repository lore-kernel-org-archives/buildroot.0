From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:36:43 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/syslog-ng: update
 the upstream URL in Config.in
Message-ID: <20191225214903.328268E460@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=605b9812dc0d9c975aa5073f6e2add37b7c05813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1a31c20c86c0e8ae71e39e7a46f94fc9e559c410)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/syslog-ng/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index fbc236221a..6b3ad67523 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	  of input and output methods: syslog, unstructured text,
 	  queueing, SQL & NoSQL
 
-	  https://syslog-ng.org/
+	  https://www.syslog-ng.com/products/open-source-log-management/
 
 comment "syslog-ng needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
