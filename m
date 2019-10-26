From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2019 22:54:27 +0200
Subject: [Buildroot] [git commit] docs/manual: python is no longer a
 mandatory dependency
Message-ID: <20191026205342.0C6E1888E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af12589c17ff4c81451ba1cb876c91c38af4294b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/prerequisite.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index dcd3fd255e..a32fdbfbc6 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -32,7 +32,6 @@ between distributions).
 ** +perl+ (version 5.8.7 or any later)
 ** +tar+
 ** +cpio+
-** +python+ (version 2.7 or any later)
 ** +unzip+
 ** +rsync+
 ** +file+ (must be in +/usr/bin/file+)
@@ -45,6 +44,14 @@ between distributions).
 
 === Optional packages
 
+* Recommended dependencies:
++
+Some features or utilities in Buildroot, like the legal-info, or the
+graph generation tools, have additional dependencies. Although they
+are not mandatory for a simple build, they are still highly recommended:
++
+** +python+ (version 2.7 or any later)
+
 * Configuration interface dependencies:
 +
 For these libraries, you need to install both runtime and development
