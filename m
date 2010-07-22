From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 13:08:24 +0200
Subject: [Buildroot] [git commit master 1/1] php: filter plugin depends on
	pcre
Message-ID: <20100722110848.B1BEB82DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6ef765d3bd17e5dc9ea2c049cb79443b23fdcd16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/Config.ext |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index d95b19e..0433abc 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -125,6 +125,7 @@ config BR2_PACKAGE_PHP_EXT_ZIP
 
 config BR2_PACKAGE_PHP_EXT_FILTER
 	bool "filter"
+	select BR2_PACKAGE_PHP_EXT_PCRE
 	help
 	  Input filter support
 
-- 
1.7.1
