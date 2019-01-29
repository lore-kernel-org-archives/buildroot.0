From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 17:35:09 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/openresolv:
 update webpage URL
Message-ID: <20190129163438.7561C81158@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2760cc78cd07c72a3e6a43193e006ee06b51296a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Update URL to point at the project page vs just the GIT repository
containing the source code.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 824e34728c5b0f94c4e1c93121cad5973bddda89)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openresolv/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openresolv/Config.in b/package/openresolv/Config.in
index 2a393c6bc4..835fbf29ee 100644
--- a/package/openresolv/Config.in
+++ b/package/openresolv/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_OPENRESOLV
 	  manages resolv.conf. This tool provides a dns management
 	  framework to track currently available nameservers.
 
-	  https://github.com/rsmarples/openresolv
+	  https://roy.marples.name/projects/openresolv
