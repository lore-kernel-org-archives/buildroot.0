From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 17:10:59 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libiscsi: update
 the upstream URL in Config.in
Message-ID: <20191203160316.7620D866E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=566c09f57745f1776ade44a33d3a37ac3a8187bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. Removing
the trailing comment from the URL line addresses the 'Missing'
status in the package stats web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8333867c7fa5356a47374a0fbb186f78ff840e11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiscsi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiscsi/Config.in b/package/libiscsi/Config.in
index 760fecea66..8e588c9ef3 100644
--- a/package/libiscsi/Config.in
+++ b/package/libiscsi/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_LIBISCSI
 	  scsi tasks, but a sync layer is also provided for ease of use
 	  for simpler applications.
 
-	  https://github.com/sahlberg/libiscsi  (no proper homepage)
+	  https://github.com/sahlberg/libiscsi
