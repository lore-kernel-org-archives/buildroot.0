From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Apr 2010 12:40:32 +0200
Subject: [Buildroot] [git commit master] logrotate: use standard wchar
	comment
Message-ID: <20100402104212.02BE58A500@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d3f777e0031c2af8d56a605d0172e66e980ff6c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/logrotate/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
index 8e61a44..0d0ec61 100644
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -7,6 +7,6 @@ config BR2_PACKAGE_LOGROTATE
 
 	  https://fedorahosted.org/logrotate/
 
-comment "logrotate     - disabled (requires wchar support)"
+comment "logrotate requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
 
-- 
1.6.3.3
