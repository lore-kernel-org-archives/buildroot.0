From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:48:13 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/cog: add an
 upstream URL to Config.in
Message-ID: <20191203134029.A075684267@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c16545abda9e4163e4b09a4b6a3ed9e4525b485f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f73e2a6c334d19d98ed99cf84ce3c460989fcc57)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cog/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index 768fcefaac..b25991d4ae 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_COG
 	  not provide any chrome, and is suitable to be used
 	  as a Web application container.
 
+	  https://github.com/Igalia/cog
+
 if BR2_PACKAGE_COG
 
 config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
