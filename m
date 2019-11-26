From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 20:57:56 +0100
Subject: [Buildroot] [git commit] package/cog: add an upstream URL to
 Config.in
Message-ID: <20191126203656.3212683820@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f73e2a6c334d19d98ed99cf84ce3c460989fcc57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
