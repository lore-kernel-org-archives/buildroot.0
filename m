From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Mar 2010 17:23:23 +0200
Subject: [Buildroot] [git commit master] classpath: trivial Config.in
	whitespace fix
Message-ID: <20100330152414.5A5262133E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c772e2c1554f8a58d781898c91d84b94d8e731d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/java/classpath/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/java/classpath/Config.in b/package/java/classpath/Config.in
index c6b5e52..5677f8c 100644
--- a/package/java/classpath/Config.in
+++ b/package/java/classpath/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_CLASSPATH
 	bool "classpath"
-
 	help
 	  GNU Classpath, Essential Libraries for Java, is a GNU
 	  project to create free core class libraries for use with
-- 
1.6.3.3
