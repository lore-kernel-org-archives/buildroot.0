From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 21:48:51 +0100
Subject: [Buildroot] [git commit] package/logrotate: update upstream site in
	Config.in help
Message-ID: <20170310204939.9423082561@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdb1ab8ca0f10782a2f5bba84a34294de18c7273
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fedorahosted.org has closed on March 1st, 2017, and we were anyway
already using github as a source for logrotate. This commit therefore
updates the Config.in help text to also use github as the upstream
site.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/logrotate/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
index 8528361..2b1ae64 100644
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LOGROTATE
 	help
 	  A simple program to rotate logs.
 
-	  https://fedorahosted.org/logrotate/
+	  https://github.com/logrotate/logrotate
 
 comment "logrotate needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
