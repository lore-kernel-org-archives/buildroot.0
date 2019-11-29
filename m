From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:07:36 +0100
Subject: [Buildroot] [git commit] package/libiscsi: update the upstream URL
 in Config.in
Message-ID: <20191129090525.F192181350@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8333867c7fa5356a47374a0fbb186f78ff840e11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. Removing
the trailing comment from the URL line addresses the 'Missing'
status in the package stats web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiscsi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiscsi/Config.in b/package/libiscsi/Config.in
index 1e75071476..932f857858 100644
--- a/package/libiscsi/Config.in
+++ b/package/libiscsi/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_LIBISCSI
 	  scsi tasks, but a sync layer is also provided for ease of use
 	  for simpler applications.
 
-	  https://github.com/sahlberg/libiscsi  (no proper homepage)
+	  https://github.com/sahlberg/libiscsi
 
 comment "libiscsi needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
