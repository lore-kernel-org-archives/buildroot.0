From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Oct 2011 16:10:58 +0200
Subject: [Buildroot] [git commit] ntfsprogs: mark as deprecated
Message-ID: <20111028141311.2561F8F290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db697f96b77199c015f57a9fdfd5dd7f0374b8bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ntfsprogs/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ntfsprogs/Config.in b/package/ntfsprogs/Config.in
index 836a2b6..561c1d4 100644
--- a/package/ntfsprogs/Config.in
+++ b/package/ntfsprogs/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NTFSPROGS
 	bool "ntfsprogs"
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
+	depends on BR2_DEPRECATED
 	help
 	  wide collection of NTFS utilities
 
